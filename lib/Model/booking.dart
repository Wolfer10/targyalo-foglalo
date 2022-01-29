
import 'package:hive/hive.dart';

part 'booking.g.dart';

@HiveType(typeId: 2)
class Booking {

  @HiveField(0)
  final DateTime dateOfBooking;
  @HiveField(1)
  final String startTime;
  @HiveField(2)
  final String endTime;
  @HiveField(3)
  final int numberOfPeople;
  @HiveField(4)
  int? price;

  Booking(
      {required this.dateOfBooking,
      required this.startTime,
      required this.endTime,
      required this.numberOfPeople,
      this.price
      });
}
