part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final bool isLoading;
  final List<SaleRecord> allRecords;
  final List<SaleRecord> filteredRecords;
  final List<ProductSaleSummary> summaries;
  final DashboardFilter filter;
  final String? error;

  const DashboardState({
    this.isLoading = false,
    this.allRecords = const [],
    this.filteredRecords = const [],
    this.summaries = const [],
    this.filter = DashboardFilter.today,
    this.error,
  });

  double get totalRevenue =>
      filteredRecords.fold(0, (sum, r) => sum + r.revenue);

  double get totalProfit =>
      filteredRecords.fold(0, (sum, r) => sum + r.profit);

  int get totalQuantity =>
      filteredRecords.fold(0, (sum, r) => sum + r.quantity);

  DashboardState copyWith({
    bool? isLoading,
    List<SaleRecord>? allRecords,
    List<SaleRecord>? filteredRecords,
    List<ProductSaleSummary>? summaries,
    DashboardFilter? filter,
    String? error,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      allRecords: allRecords ?? this.allRecords,
      filteredRecords: filteredRecords ?? this.filteredRecords,
      summaries: summaries ?? this.summaries,
      filter: filter ?? this.filter,
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, allRecords, filteredRecords, summaries, filter, error];
}
