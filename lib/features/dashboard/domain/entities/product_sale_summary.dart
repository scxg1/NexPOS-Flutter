import 'package:equatable/equatable.dart';

class ProductSaleSummary extends Equatable {
  final String productId;
  final String productName;
  final int totalQuantity;
  final double totalRevenue;
  final double totalProfit;

  const ProductSaleSummary({
    required this.productId,
    required this.productName,
    required this.totalQuantity,
    required this.totalRevenue,
    required this.totalProfit,
  });

  @override
  List<Object?> get props =>
      [productId, productName, totalQuantity, totalRevenue, totalProfit];
}
