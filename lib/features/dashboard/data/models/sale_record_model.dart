import 'package:hive/hive.dart';
import '../../domain/entities/sale_record.dart';

part 'sale_record_model.g.dart';

@HiveType(typeId: 2)
class SaleRecordModel extends HiveObject {
  @HiveField(0)
  final String productId;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  final double salePrice;

  @HiveField(3)
  final double wholesalePrice;

  @HiveField(4)
  final int quantity;

  @HiveField(5)
  final DateTime soldAt;

  SaleRecordModel({
    required this.productId,
    required this.productName,
    required this.salePrice,
    required this.wholesalePrice,
    required this.quantity,
    required this.soldAt,
  });

  factory SaleRecordModel.fromEntity(SaleRecord record) {
    return SaleRecordModel(
      productId: record.productId,
      productName: record.productName,
      salePrice: record.salePrice,
      wholesalePrice: record.wholesalePrice,
      quantity: record.quantity,
      soldAt: record.soldAt,
    );
  }

  SaleRecord toEntity() {
    return SaleRecord(
      productId: productId,
      productName: productName,
      salePrice: salePrice,
      wholesalePrice: wholesalePrice,
      quantity: quantity,
      soldAt: soldAt,
    );
  }
}
