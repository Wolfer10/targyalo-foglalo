import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:targyalo_foglalo/screens/take_document_pic.dart';

class DocumentPicture extends StatefulWidget {
  const DocumentPicture({Key? key}) : super(key: key);

  @override
  _DocumentPictureState createState() => _DocumentPictureState();
}

class _DocumentPictureState extends State<DocumentPicture> {
  File? image;

  @override
  void initState() {
    super.initState();
    initImage();
  }

  Future<void> initImage() async {
    final path = join(
      // A képet az ideiglenes könyvtárban tároljuk.
      // A `path_provider` függőség segít a könytvár helyének meghatározásában.
      (await getApplicationDocumentsDirectory()).path,
      'document.png',
    );
    final file = File(path);
    if (file.existsSync()) {
      setState(() {
        image = file;
      });
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (image?.existsSync() == true)
          Image(
              image: Image.memory(
            image!.readAsBytesSync(),
            fit: BoxFit.fill,
          ).image),
        ElevatedButton(
            onPressed: () async {
              File newImage = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TakeDocumentPictureScreen(),
                ),
              );
              setImage(newImage);
            }, child: Text((image?.existsSync() != true) ? "Kérem adja meg a személyi dokumentumát" : "Másik dokumentum feltöltése"),
        ),
      ],
    );
  }
}
