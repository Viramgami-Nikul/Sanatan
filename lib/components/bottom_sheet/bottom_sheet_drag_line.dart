import 'package:flutter/material.dart';

import 'package:santvani_app/theme/app_colors.dart';

class BottomSheetDragLine
    extends StatelessWidget {
  const BottomSheetDragLine({
    super.key,
  });

  @override
  Widget build(
      final BuildContext context,
      ) {
    return Container(
      height: 5,

      width: 60,

      margin:
      const EdgeInsets.only(
        bottom: 8,
      ),

      decoration: BoxDecoration(
        color:
        AppColors
            .colorPrimary500,

        borderRadius:
        BorderRadius.circular(
          12,
        ),
      ),
    );
  }
}
