import 'package:flutter/material.dart';

import 'package:santvani_app/helper/extension/navigator_ext.dart';

import 'package:santvani_app/theme/app_colors.dart';

import 'package:santvani_app/theme/font_styles.dart';

import 'package:santvani_app/utils/utils.dart';

class AppbarWithBackIconAndTitle
    extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarWithBackIconAndTitle({
    super.key,

    this.title = '',

    this.leadingAction,

    this.leadingIcon,

    this.titleColor =
        Colors.black,

    this.height = 50,
  });

  final String title;

  final Widget? leadingIcon;

  final VoidCallback?
  leadingAction;

  final Color titleColor;

  final double height;

  @override
  Widget build(
      final BuildContext context,
      ) {
    return SafeArea(
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment
            .center,

        mainAxisSize:
        MainAxisSize.max,

        mainAxisAlignment:
        MainAxisAlignment
            .center,

        children: <Widget>[
          7.w,

          IconButton(
            onPressed:
            leadingAction ??
                    () {
                  context.pop();
                },

            icon:
            leadingIcon ??
                Icon(
                  Icons
                      .arrow_back_ios_new_rounded,

                  color:
                  AppColors.black,
                ),
          ),

          Expanded(
            child: Center(
              child: Text(
                title,

                style:
                dMSansW700
                    .copyWith(
                  color:
                  titleColor,

                  fontSize:
                  20,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 50,
            width: 50,
          ),

          7.w,
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height);
}

class AppbarWithTitle
    extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarWithTitle({
    super.key,

    this.title = '',

    this.titleStyle,

    this.height = 50,
  });

  final String title;

  final TextStyle?
  titleStyle;

  final double height;

  @override
  Widget build(
      final BuildContext context,
      ) {
    return SafeArea(
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment
            .center,

        mainAxisSize:
        MainAxisSize.max,

        mainAxisAlignment:
        MainAxisAlignment
            .center,

        children: <Widget>[
          const Spacer(),

          Text(
            title,

            style:
            titleStyle ??
                dMSansW700
                    .copyWith(
                  color:
                  AppColors.black,

                  fontSize: 20,
                ),
          ),

          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height);
}

class AppbarWithBackIconTitleAndSuffixWidget
    extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarWithBackIconTitleAndSuffixWidget({
    super.key,

    required this.title,

    required this.suffixWidget,

    this.backIcon,

    this.showBackIcon,

    this.height = 50,

    this.leadingAction,

    this.leadingIcon,

    this.titleColor =
        Colors.black,

    this.titleStyle,
  });

  final String title;

  final Widget suffixWidget;

  final String? backIcon;

  final bool? showBackIcon;

  final Widget? leadingIcon;

  final VoidCallback?
  leadingAction;

  final Color titleColor;

  final double height;

  final TextStyle?
  titleStyle;

  @override
  Widget build(
      final BuildContext context,
      ) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          7.w,

          Visibility(
            visible:
            showBackIcon ??
                true,

            replacement:
            const SizedBox(
              height: 50,
              width: 50,
            ),

            child: IconButton(
              onPressed:
              leadingAction ??
                      () {
                    context.pop();
                  },

              icon:
              leadingIcon ??
                  Icon(
                    Icons
                        .arrow_back_ios_new_rounded,

                    color:
                    AppColors.black,
                  ),
            ),
          ),

          10.w,

          Expanded(
            child: Center(
              child: Text(
                title,

                maxLines: 1,

                overflow:
                TextOverflow
                    .ellipsis,

                style:
                titleStyle ??
                    dMSansW700
                        .copyWith(
                      color:
                      titleColor,

                      fontSize:
                      20,
                    ),
              ),
            ),
          ),

          10.w,

          suffixWidget,

          7.w,
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height);
}
