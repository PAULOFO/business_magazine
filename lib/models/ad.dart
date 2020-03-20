import 'package:businessmagazine/models/address.dart';

class Ad {

  List<dynamic> images;
  String title;
  String description;
  Address address;
  num price;
  bool hidePhone;

  DateTime dateCreated = DateTime.now();///Pega o tempo no momento

  @override
  String toString() {
    return '$images, $title, $description, $address, $price, $hidePhone';
  }

}