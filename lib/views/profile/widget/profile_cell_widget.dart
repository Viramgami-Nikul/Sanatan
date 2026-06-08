import 'package:flutter/material.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/data/models/others/profile_options_model.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';

class ProfileCell extends StatelessWidget {
  final ProfileOptionsModel item;

  const ProfileCell({
    super.key,
    required this.item,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isLogout = item.option == ProfileOption.logout;

    return GestureDetector(
      onTap: () {
        item.onTap?.call(context);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color:
            isLogout
                ? AppColors.colorError500.withValues(alpha: 0.15)
                : AppColors.baseColorWhite85.withValues(alpha: 0.2),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: <Widget>[
            /// ICON CONTAINER
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient:
                isLogout
                    ? LinearGradient(
                  colors: <Color>[
                    AppColors.colorError500.withValues(alpha: 0.15),
                    AppColors.colorError500.withValues(alpha: 0.05),
                  ],
                )
                    : LinearGradient(
                  colors: <Color>[
                    AppColors.colorA478D1.withValues(alpha: 0.15),
                    AppColors.color4478D1.withValues(alpha: 0.08),
                  ],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: item.icon,
            ),

            18.w,

            /// TITLE
            Expanded(
              child: Text(
                item.option.title.tr(context),
                style: dMSansW600.copyWith(
                  fontSize: 16,
                  color:
                  isLogout
                      ? AppColors.colorError500
                      : AppColors.color4478D1,
                ),
              ),
            ),

            10.w,

            /// ARROW ICON
            Container(
              height: 34,
              width: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:
                isLogout
                    ? AppColors.colorError500.withValues(alpha: 0.08)
                    : AppColors.colorPrimary500.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color:
                isLogout
                    ? AppColors.colorError500
                    : AppColors.colorPrimary500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
