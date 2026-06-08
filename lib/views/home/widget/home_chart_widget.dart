import 'package:flutter/material.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class HomeChartWidget extends StatelessWidget {
  const HomeChartWidget({super.key});

  /// Mock bar data: 7 days of relative values
  static const List<double> _barValues = <double>[
    0.45, 0.65, 0.50, 0.80, 0.55, 0.75, 0.60,
  ];

  static const List<String> _days = <String>[
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  @override
  Widget build(final BuildContext context) {
    final String month =
        _monthLabel(DateTime.now().subtract(const Duration(days: 7)));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Last Week Summary',
                  style: dMSansW700.copyWith(
                    fontSize: 15,
                    color: AppColors.colorNeutral900,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.colorNeutral200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    month.toUpperCase(),
                    style: dMSansW600.copyWith(
                      fontSize: 11,
                      color: AppColors.colorNeutral700,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Y-axis labels
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Text('25k', style: TextStyle(fontSize: 9, color: Color(0xFF9CA3AF))),
                    SizedBox(height: 18),
                    Text('20k', style: TextStyle(fontSize: 9, color: Color(0xFF9CA3AF))),
                    SizedBox(height: 18),
                    Text('15k', style: TextStyle(fontSize: 9, color: Color(0xFF9CA3AF))),
                  ],
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List<Widget>.generate(
                        _barValues.length,
                        (final int i) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: Duration(
                                    milliseconds: 400 + (i * 60),
                                  ),
                                  height: 72 * _barValues[i],
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        AppColors.colorPrimary400,
                                        AppColors.color4478D1,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(5),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _days[i],
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _monthLabel(final DateTime date) {
    const List<String> months = <String>[
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
