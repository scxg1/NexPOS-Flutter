import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/sale_record.dart';
import '../entities/product_sale_summary.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<SaleRecord>>> getSaleRecords();
  Future<Either<Failure, void>> addSaleRecords(List<SaleRecord> records);
  List<ProductSaleSummary> summarizeByProduct(List<SaleRecord> records);
}
