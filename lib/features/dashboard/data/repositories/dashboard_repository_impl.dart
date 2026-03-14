import 'package:fpdart/fpdart.dart';
import '../../../../core/data/hive_database.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/product_sale_summary.dart';
import '../../domain/entities/sale_record.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../models/sale_record_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Either<Failure, List<SaleRecord>>> getSaleRecords() async {
    try {
      final box = HiveDatabase.salesBox;
      final records = box.values.map((m) => m.toEntity()).toList();
      return Right(records);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addSaleRecords(List<SaleRecord> records) async {
    try {
      final box = HiveDatabase.salesBox;
      for (final record in records) {
        final model = SaleRecordModel.fromEntity(record);
        await box.add(model);
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  List<ProductSaleSummary> summarizeByProduct(List<SaleRecord> records) {
    final Map<String, ProductSaleSummary> summaryMap = {};
    for (final record in records) {
      if (summaryMap.containsKey(record.productId)) {
        final existing = summaryMap[record.productId]!;
        summaryMap[record.productId] = ProductSaleSummary(
          productId: existing.productId,
          productName: existing.productName,
          totalQuantity: existing.totalQuantity + record.quantity,
          totalRevenue: existing.totalRevenue + record.revenue,
          totalProfit: existing.totalProfit + record.profit,
        );
      } else {
        summaryMap[record.productId] = ProductSaleSummary(
          productId: record.productId,
          productName: record.productName,
          totalQuantity: record.quantity,
          totalRevenue: record.revenue,
          totalProfit: record.profit,
        );
      }
    }
    final list = summaryMap.values.toList();
    list.sort((a, b) => b.totalRevenue.compareTo(a.totalRevenue));
    return list;
  }
}
