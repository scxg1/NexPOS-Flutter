import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String
      id; // Using barcode as ID usually, but keeping separate ID is safer
  final String name;
  final String barcode;
  final double price;
  final double wholesalePrice; // Used to calculate net profit
  final int stock; // Optional implementation detail

  const Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.price,
    this.wholesalePrice = 0.0,
    this.stock = 0,
  });

  @override
  List<Object?> get props => [id, name, barcode, price, wholesalePrice, stock];
}
