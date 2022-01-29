import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../camera_manager.dart';

class TakeDocumentPictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var camera = context.watch<CameraDescription?>();
    if (camera == null) {
      return CircularProgressIndicator();
    }
    return TakeDocumentPicture(camera: camera);
  }
}

class TakeDocumentPicture extends StatefulWidget {
  final CameraDescription camera;

  const TakeDocumentPicture({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _TakeDocumentPictureState createState() => _TakeDocumentPictureState();
}

class _TakeDocumentPictureState extends State<TakeDocumentPicture> {
  late Future<void> _initializeControllerFuture;
  late CameraManager cameraManager;

  void initState() {
    super.initState();

    cameraManager = CameraManager(camera: widget.camera);

    // Inicializáljuk a kontrollert.
    _initializeControllerFuture = cameraManager.initialize();
  }

  @override
  void dispose() {
    cameraManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take a pic"),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // A kamera inicializálódott, meg lehet mutatni az előképet
            return CameraPreview(cameraManager.cameraController);
          } else {
            // Még nincs áll rendelkezésre a kamera, betöltő ikon-t mutatunk addig.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            // Inicializáljuk a kamerát
            await _initializeControllerFuture;

            // A kép mentésének a helye.
            final path = join(
              (await getApplicationDocumentsDirectory()).path,
              'document.png',
            );
            final file = File(path);
            if (file.existsSync()) {
              file.deleteSync();
            }
            // Készítunk egy képet
            final picture = await cameraManager.cameraController.takePicture();
            final pictureFile = File(picture.path);
            await pictureFile.copy(file.path);

            // Visszaadjuk a mentett fájlt az előző képernyőnek.
            Navigator.pop(context, file);
          } catch (e) {
            // Valami hiba volt...
            print(e);
          }
        },
      ),
    );
  }
}
