import 'package:flutter/material.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class HomeSummaryWidget extends StatelessWidget {
  const HomeSummaryWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Total Summary',
            style: dMSansW700.copyWith(
              fontSize: 16,
              color: AppColors.colorNeutral900,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            children: <Widget>[
              // Total Retailers card
              Expanded(
                child: _SummaryCard(
                  icon: Icons.people_alt_outlined,
                  iconColor: AppColors.colorPrimary500,
                  iconBg: AppColors.colorPrimary100,
                  label: 'Total retailers',
                  value: '57',
                  valueStyle: dMSansW700.copyWith(
                    fontSize: 28,
                    color: AppColors.colorNeutral900,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Right column — profit + turnover stacked
              Expanded(
                child: Column(
                  children: <Widget>[
                    _SummaryCard(
                      icon: Icons.trending_up_rounded,
                      iconColor: const Color(0xFF2ECC71),
                      iconBg: const Color(0xFFDCFCE7),
                      label: 'Monthly Profit',
                      value: '2,35,080.00',
                      valueStyle: dMSansW700.copyWith(
                        fontSize: 15,
                        color: AppColors.colorNeutral900,
                      ),
                    ),

                    const SizedBox(height: 12),

                    _SummaryCard(
                      icon: Icons.bar_chart_rounded,
                      iconColor: AppColors.color4478D1,
                      iconBg: AppColors.colorPrimary100,
                      label: 'Monthly Turnover',
                      value: '10,24,349.00',
                      valueStyle: dMSansW700.copyWith(
                        fontSize: 15,
                        color: AppColors.colorNeutral900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.label,
    required this.value,
    required this.valueStyle,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String label;
  final String value;
  final TextStyle valueStyle;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: iconColor),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: valueStyle,
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: dMSansW400.copyWith(
              fontSize: 12,
              color: AppColors.colorNeutral600,
            ),
          ),
        ],
      ),
    );
  }
}
