import 'package:flutter/material.dart';
import 'package:santvani_app/helper/extension/localization_extension.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/utils.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.selectedDate,
    required this.onPressed,
    this.hintText,
    this.firstDate,
    this.lastDate,
  });

  final String? selectedDate;
  final Function(DateTime) onPressed;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime now = DateTime.now();

        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate:
          lastDate ??
              now.subtract(const Duration(days: 18 * 365)),
          firstDate:
          firstDate ??
              now.subtract(const Duration(days: 70 * 365)),
          lastDate:
          lastDate ??
              now.subtract(const Duration(days: 13 * 365)),
          builder: (
              final BuildContext context,
              final Widget? child,
              ) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.colorPrimary500,
                  onPrimary: AppColors.white,
                  onSurface: AppColors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          onPressed(pickedDate);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        decoration: Utils.borderBox(
          borderColor: AppColors.baseColorWhite85,
          radius: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child:
              selectedDate != null &&
                  selectedDate!.isNotEmpty
                  ? Text(
                selectedDate!.tr(context),
                style: dMSansW500.copyWith(
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              )
                  : Text(
                hintText?.tr(context) ??
                    'Select Date of Birth'.tr(context),
                style: dMSansW400.copyWith(
                  fontSize: 13,
                  color: AppColors.baseColorWhite45,
                ),
              ),
            ),
            10.w,
            Icon(
              Icons.calendar_month_rounded,
              color: AppColors.colorPrimary500,
            ),
          ],
        ),
      ),
    );
  }
}
