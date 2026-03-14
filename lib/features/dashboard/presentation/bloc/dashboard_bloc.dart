import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product_sale_summary.dart';
import '../../domain/entities/sale_record.dart';
import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository repository;

  DashboardBloc({required this.repository}) : super(const DashboardState()) {
    on<LoadDashboardEvent>(_onLoad);
    on<ChangeDashboardFilterEvent>(_onChangeFilter);
    on<RecordSaleEvent>(_onRecordSale);
  }

  Future<void> _onLoad(LoadDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await repository.getSaleRecords();
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (records) {
        final filtered = _filter(records, state.filter);
        final summaries = repository.summarizeByProduct(filtered);
        emit(state.copyWith(
          isLoading: false,
          allRecords: records,
          filteredRecords: filtered,
          summaries: summaries,
          error: null,
        ));
      },
    );
  }

  void _onChangeFilter(ChangeDashboardFilterEvent event, Emitter<DashboardState> emit) {
    final filtered = _filter(state.allRecords, event.filter);
    final summaries = repository.summarizeByProduct(filtered);
    emit(state.copyWith(
      filter: event.filter,
      filteredRecords: filtered,
      summaries: summaries,
    ));
  }

  Future<void> _onRecordSale(RecordSaleEvent event, Emitter<DashboardState> emit) async {
    await repository.addSaleRecords(event.records);
    // Reload after recording
    add(const LoadDashboardEvent());
  }

  List<SaleRecord> _filter(List<SaleRecord> records, DashboardFilter filter) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    switch (filter) {
      case DashboardFilter.today:
        return records.where((r) {
          final d = DateTime(r.soldAt.year, r.soldAt.month, r.soldAt.day);
          return d == today;
        }).toList();
      case DashboardFilter.yesterday:
        return records.where((r) {
          final d = DateTime(r.soldAt.year, r.soldAt.month, r.soldAt.day);
          return d == yesterday;
        }).toList();
      case DashboardFilter.allTime:
        return records;
    }
  }
}
