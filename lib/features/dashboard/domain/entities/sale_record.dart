import 'package:equatable/equatable.dart';

class SaleRecord extends Equatable {
  final String productId;
  final String productName;
  final double salePrice;
  final double wholesalePrice;
  final int quantity;
  final DateTime soldAt;

  const SaleRecord({
    required this.productId,
    required this.productName,
    required this.salePrice,
    required this.wholesalePrice,
    required this.quantity,
    required this.soldAt,
  });

  double get revenue => salePrice * quantity;
  double get profit => (salePrice - wholesalePrice) * quantity;

  @override
  List<Object?> get props => [productId, productName, salePrice, wholesalePrice, quantity, soldAt];
}
