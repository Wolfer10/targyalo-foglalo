// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetingRoom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeetingRoomAdapter extends TypeAdapter<MeetingRoom> {
  @override
  final int typeId = 1;

  @override
  MeetingRoom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeetingRoom(
      (fields[3] as List).cast<Booking>(),
      name: fields[0] as String,
      address: fields[1] as Address,
      price: fields[2] as int,
      imageRoute: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MeetingRoom obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.bookings)
      ..writeByte(4)
      ..write(obj.imageRoute);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeetingRoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
