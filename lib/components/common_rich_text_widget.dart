import 'package:flutter/cupertino.dart';

import 'package:santvani_app/helper/extension/localization_extension.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

class CommonRichTextWidget extends StatelessWidget {
  final String strHeaderTitle;

  final String strSubTitle;

  final bool isRequired;

  final double fontSize;

  const CommonRichTextWidget({
    super.key,

    this.strHeaderTitle = '',

    this.isRequired = true,

    this.strSubTitle = '',

    this.fontSize = 16,
  });

  @override
  Widget build(final BuildContext context) {
    return RichText(
      text: TextSpan(
        text: strHeaderTitle.tr(context),

        style: interW500.copyWith(
          fontSize: fontSize,

          color: AppColors.black,
        ),

        children:
        isRequired
            ? <TextSpan>[
          TextSpan(
            text: ' *',

            style: interW500.copyWith(
              fontSize: fontSize,

              color:
              AppColors.colorError500,
            ),
          ),
        ]
            : <InlineSpan>[
          TextSpan(
            text:
            strSubTitle.isNotEmpty
                ? ' ${strSubTitle.tr(context)}'
                : '',

            style: interW500.copyWith(
              fontSize: fontSize - 1,

              color:
              AppColors.colorPrimary500,
            ),
          ),
        ],
      ),
    );
  }
}
