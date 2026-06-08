import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:santvani_app/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/routes/routes_name.dart';

class CreateOptionsBottomSheet extends StatelessWidget {
  const CreateOptionsBottomSheet({
    super.key,
    this.onTapReel,
    this.onTapPost,
    this.onTapStory,
  });

  final VoidCallback? onTapReel;
  final VoidCallback? onTapPost;
  final VoidCallback? onTapStory;

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const BottomSheetDragLine(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Create',
                    style: dMSansW700.copyWith(
                      fontSize: 18,
                      color: const Color(0xFFE65100), // Premium Saffron header
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildOptionItem(
                  context,
                  icon: Icons.movie_creation_outlined,
                  label: 'Reel',
                  onTap: () {
                    Navigator.pop(context);
                    if (onTapReel != null) {
                      onTapReel!.call();
                    } else {
                      _showSnackBar(context, 'Creating Reel... 🌸🙏');
                    }
                  },
                ),
                _buildDivider(),
                _buildOptionItem(
                  context,
                  icon: Icons.grid_on_rounded,
                  label: 'Post',
                  onTap: () {
                    Navigator.pop(context);
                    if (onTapPost != null) {
                      onTapPost!.call();
                    } else {
                      Navigator.pushNamed(context, RouteName.postScreen);
                    }
                  },
                ),
                _buildDivider(),
                _buildOptionItem(
                  context,
                  icon: Icons.add_circle_outline_rounded,
                  label: 'Story',
                  onTap: () {
                    Navigator.pop(context);
                    if (onTapStory != null) {
                      onTapStory!.call();
                    } else {
                      _showSnackBar(context, 'Creating Story... 🌸🙏');
                    }
                  },
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(
    final BuildContext context, {
    required final IconData icon,
    required final String label,
    required final VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 24,
              color: const Color(0xFFE65100), // Saffron icon accent
            ),
            const SizedBox(width: 18),
            Text(
              label,
              style: dMSansW500.copyWith(
                fontSize: 15,
                color: AppColors.colorNeutral800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 0.8,
      color: const Color(0xFFFFCC80).withValues(alpha: 0.25), // Elegant saffron separator line
      indent: 42, // Indents the separator to align with text starts
    );
  }

  void _showSnackBar(final BuildContext context, final String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFE65100),
        duration: const Duration(seconds: 2),
        content: Text(
          text,
          style: dMSansW500.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
