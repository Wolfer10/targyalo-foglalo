import 'package:hive/hive.dart';
part 'address.g.dart';

@HiveType(typeId: 3)
class Address{
  @HiveField(0)
  final String street;
  @HiveField(1)
  final String postalCode;
  @HiveField(2)
  final String city;
  const Address({required this.street, required this.postalCode, required this.city});

}