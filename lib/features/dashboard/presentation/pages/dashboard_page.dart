import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../../core/theme/app_theme.dart';
import '../bloc/dashboard_bloc.dart';
import '../../domain/entities/product_sale_summary.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(const LoadDashboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              // App Bar
              SliverAppBar(
                expandedHeight: 120,
                floating: false,
                pinned: true,
                backgroundColor: AppTheme.primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    l10n.dashboard,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withValues(alpha: 0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ),

              // Filter Chips
              SliverToBoxAdapter(
                child: Container(
                  color: AppTheme.primaryColor,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 4),
                  child: Row(
                    children: [
                      _filterChip(l10n.today, DashboardFilter.today, state),
                      const SizedBox(width: 8),
                      _filterChip(
                          l10n.yesterday, DashboardFilter.yesterday, state),
                      const SizedBox(width: 8),
                      _filterChip(l10n.allTime, DashboardFilter.allTime, state),
                    ],
                  ),
                ),
              ),

              // Stats Cards
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _statCard(
                              icon: Icons.shopping_bag_outlined,
                              label: l10n.productsSold,
                              value: state.totalQuantity.toString(),
                              color: const Color(0xFF6C63FF),
                              bgColor: const Color(0xFFEEEDFF),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _statCard(
                              icon: Icons.attach_money,
                              label: l10n.totalRevenue,
                              value:
                                  '₹${state.totalRevenue.toStringAsFixed(0)}',
                              color: const Color(0xFF0EA5E9),
                              bgColor: const Color(0xFFE0F2FE),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _statCard(
                        icon: Icons.trending_up,
                        label: l10n.netProfit,
                        value: '₹${state.totalProfit.toStringAsFixed(0)}',
                        color: state.totalProfit >= 0
                            ? const Color(0xFF10B981)
                            : const Color(0xFFEF4444),
                        bgColor: state.totalProfit >= 0
                            ? const Color(0xFFD1FAE5)
                            : const Color(0xFFFEE2E2),
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),
              ),

              // Breakdown Header
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    l10n.salesBreakdown.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        letterSpacing: 1.2),
                  ),
                ),
              ),

              // Breakdown Table Header
              if (state.summaries.isNotEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.08),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(l10n.productName,
                              style: _headerStyle()),
                        ),
                        Expanded(
                          child: Text(l10n.quantity,
                              textAlign: TextAlign.center,
                              style: _headerStyle()),
                        ),
                        Expanded(
                          child: Text(l10n.revenue,
                              textAlign: TextAlign.right,
                              style: _headerStyle()),
                        ),
                        Expanded(
                          child: Text(l10n.profit,
                              textAlign: TextAlign.right,
                              style: _headerStyle()),
                        ),
                      ],
                    ),
                  ),
                ),

              // Breakdown Rows
              if (state.summaries.isEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.bar_chart_outlined,
                            size: 48, color: Colors.grey[300]),
                        const SizedBox(height: 12),
                        Text(l10n.noSalesData,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(l10n.noSalesForPeriod,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500])),
                      ],
                    ),
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final s = state.summaries[index];
                      final isLast = index == state.summaries.length - 1;
                      return _buildBreakdownRow(s, index, isLast);
                    },
                    childCount: state.summaries.length,
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          );
        },
      ),
    );
  }

  Widget _filterChip(
      String label, DashboardFilter filter, DashboardState state) {
    final isSelected = state.filter == filter;
    return GestureDetector(
      onTap: () => context
          .read<DashboardBloc>()
          .add(ChangeDashboardFilterEvent(filter)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppTheme.primaryColor : Colors.white,
            fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required Color bgColor,
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(value,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: color)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(
      ProductSaleSummary s, int index, bool isLast) {
    final isEven = index % 2 == 0;
    return Container(
      margin: isLast
          ? const EdgeInsets.symmetric(horizontal: 16)
          : const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isEven ? Colors.white : const Color(0xFFF8FAFC),
        borderRadius: isLast
            ? const BorderRadius.vertical(bottom: Radius.circular(12))
            : null,
        border: Border(
          left: BorderSide(color: Colors.grey[100]!),
          right: BorderSide(color: Colors.grey[100]!),
          bottom: BorderSide(color: Colors.grey[100]!),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              s.productName,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              '${s.totalQuantity}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              '₹${s.totalRevenue.toStringAsFixed(0)}',
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0EA5E9)),
            ),
          ),
          Expanded(
            child: Text(
              '₹${s.totalProfit.toStringAsFixed(0)}',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: s.totalProfit >= 0
                      ? const Color(0xFF10B981)
                      : const Color(0xFFEF4444)),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _headerStyle() {
    return TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.grey[600],
        letterSpacing: 0.5);
  }
}
