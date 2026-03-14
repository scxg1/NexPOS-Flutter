part of 'dashboard_bloc.dart';

enum DashboardFilter { today, yesterday, allTime }

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

class LoadDashboardEvent extends DashboardEvent {
  const LoadDashboardEvent();
}

class ChangeDashboardFilterEvent extends DashboardEvent {
  final DashboardFilter filter;
  const ChangeDashboardFilterEvent(this.filter);
  @override
  List<Object?> get props => [filter];
}

class RecordSaleEvent extends DashboardEvent {
  final List<SaleRecord> records;
  const RecordSaleEvent(this.records);
  @override
  List<Object?> get props => [records];
}
