import 'package:flutter/material.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

/// Quick link data model
class _QuickLink {
  const _QuickLink({
    required this.label,
    required this.icon,
    required this.color,
  });
  final String label;
  final IconData icon;
  final Color color;
}

class HomeQuickLinksWidget extends StatelessWidget {
  const HomeQuickLinksWidget({super.key});

  static const List<_QuickLink> _links = <_QuickLink>[
    _QuickLink(label: 'Retailers',   icon: Icons.storefront_outlined,       color: Color(0xFFFF6B6B)),
    _QuickLink(label: 'Products',    icon: Icons.inventory_2_outlined,       color: Color(0xFF4ECDC4)),
    _QuickLink(label: 'Expense',     icon: Icons.receipt_long_outlined,      color: Color(0xFFFFB347)),
    _QuickLink(label: 'Route Plan',  icon: Icons.map_outlined,               color: Color(0xFF9B59B6)),
    _QuickLink(label: 'Collections', icon: Icons.payments_outlined,          color: Color(0xFF3498DB)),
    _QuickLink(label: 'Set Prices',  icon: Icons.price_change_outlined,      color: Color(0xFF2ECC71)),
    _QuickLink(label: 'Stock',       icon: Icons.warehouse_outlined,         color: Color(0xFFE67E22)),
    _QuickLink(label: 'Reports',     icon: Icons.bar_chart_outlined,         color: Color(0xFFE74C3C)),
  ];

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Quick Links',
            style: dMSansW700.copyWith(
              fontSize: 16,
              color: AppColors.colorNeutral900,
            ),
          ),

          const SizedBox(height: 14),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.78,
              mainAxisSpacing: 14,
              crossAxisSpacing: 10,
            ),
            itemCount: _links.length,
            itemBuilder: (final BuildContext ctx, final int i) {
              return _QuickLinkItem(link: _links[i]);
            },
          ),
        ],
      ),
    );
  }
}

class _QuickLinkItem extends StatelessWidget {
  const _QuickLinkItem({required this.link});
  final _QuickLink link;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: link.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(link.icon, size: 26, color: link.color),
          ),
          const SizedBox(height: 6),
          Text(
            link.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: dMSansW500.copyWith(
              fontSize: 11,
              color: AppColors.colorNeutral700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
