import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/components/bottom_sheet/image_picker_option_bottom_sheet.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/views/profile/widget/language_bottom_sheet.dart';
import 'package:santvani_app/views/profile/widget/logout_bottom_sheet.dart';
import 'package:santvani_app/views/profile/widget/profile_stats_header_widget.dart';
import 'package:santvani_app/views/profile/widget/profile_bio_widget.dart';
import 'package:santvani_app/views/profile/widget/profile_actions_widget.dart';
import 'package:santvani_app/views/profile/widget/profile_post_grid_widget.dart';

import 'package:santvani_app/components/bottom_sheet/create_options_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: lightStatusBarTransparent,
      child: BlocBuilder<LocalisationBloc, LocalisationState>(
        builder: (
          final BuildContext localisationContext,
          final LocalisationState localisationState,
        ) {
          return BlocConsumer<ProfileBloc, ProfileState>(
              listener: (
                final BuildContext context,
                final ProfileState state,
              ) async {
                // Logout bottom sheet triggers from BLoC state
                if (state.showLogoutSheet) {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (final BuildContext ccontext) => LogoutBottomSheet(
                      onTapLogout: () {
                        context.read<ProfileBloc>().add(CallLogoutApi());
                      },
                    ),
                  );
                }

                // Profile photo edit sheet triggers
                if (state.showProfilePhotoEditSheet) {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (final BuildContext ccontext) {
                      final ProfileBloc bloc = context.read<ProfileBloc>();
                      return ImagePickerOptionBottomSheet(
                        onTapCamera: () async {
                          final PermissionStatus status = await Utils.checkCameraPermission(ccontext);
                          if (status.isGranted) {
                            final XFile? profileMedia = await Utils.pickImage(PhotoPickerType.camera);
                            if (profileMedia != null) {
                              bloc.add(OnSelectProfilePhoto(imagePath: profileMedia.path));
                            }
                          }
                        },
                        onTapGallery: () async {
                          final PermissionStatus status = await Utils.checkPhotosPermission(ccontext);
                          if (status.isGranted || status.isLimited) {
                            final XFile? profileMedia = await Utils.pickImage(PhotoPickerType.photos);
                            if (profileMedia != null) {
                              bloc.add(OnSelectProfilePhoto(imagePath: profileMedia.path));
                            }
                          }
                        },
                      );
                    },
                  );
                }

                // Redirect to login
                if (state.navigateToLogin == true) {
                  context.read<ProfileBloc>().navigateToLoginScreen(context);
                }

                // Language selection triggers
                if (state.showLanguageSheet == true) {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (final BuildContext ccontext) => LanguageBottomSheet(
                      onTapChangeLanguage: (final value) {
                        context.read<LocalisationBloc>().add(
                          OnChangeLanguage(Locale(value.langCode, value.countryCode)),
                        );
                      },
                    ),
                  );
                }
              },
              builder: (final BuildContext context, final ProfileState state) {
                final String username = state.userData?.username ?? 'nikul_prajapati';

                return Scaffold(
                  backgroundColor: const Color(0xFFFCF8F2),
                  appBar: AppBar(
                    backgroundColor: const Color(0xFFFCF8F2),
                    elevation: 0,
                    leadingWidth: 64,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color(0xFFFF9933), // Saffron
                              Color(0xFFFF5722), // Deep Orange
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0xFFFF5722).withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                builder: (final BuildContext ccontext) => const CreateOptionsBottomSheet(),
                              );
                            },
                            child: const Icon(
                              Icons.add_rounded,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    centerTitle: true,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.lock_outline_rounded, size: 14, color: Color(0xFFE65100)),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            username,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: dMSansW700.copyWith(fontSize: 15, color: const Color(0xFFE65100)),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: Color(0xFFE65100)),
                        Container(
                          margin: const EdgeInsets.only(left: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB300),
                            shape: BoxShape.circle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: const Color(0xFFFFB300).withValues(alpha: 0.6),
                                blurRadius: 4,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      // Email action button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFF3E0),
                            border: Border.all(
                              color: const Color(0xFFFFCC80),
                              width: 1.5,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.alternate_email_rounded, size: 18, color: Color(0xFFE65100)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Hamburger menu action button
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFF3E0),
                            border: Border.all(
                              color: const Color(0xFFFFCC80),
                              width: 1.5,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.menu_rounded, size: 18, color: Color(0xFFE65100)),
                            onPressed: () {
                              context.read<ProfileBloc>().add(OnTapLogout());
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(2),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFFFFD700), // Gold
                              Color(0xFFFF9933), // Saffron
                              Color(0xFFFF3300), // Divine Vermilion
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  body: Stack(
                    children: <Widget>[
                      const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 18),
                            // User Info (Avatar + Stats) - Modularized
                            ProfileStatsHeaderWidget(),
                            SizedBox(height: 12),
                            // Bio details - Modularized
                            ProfileBioWidget(),
                            SizedBox(height: 18),
                            // Profile Action Buttons - Modularized
                            ProfileActionsWidget(),
                            SizedBox(height: 18),
                            // Tab bars & 3-Column Posts Grid - Modularized
                            ProfilePostGridWidget(),
                            SizedBox(height: 100), // Spacing for floating bottom navigation bar
                          ],
                        ),
                      ),
                      // Loader overlay
                      if (state.status == CommonScreenState.loading)
                        Utils.loaderBrier(),
                      if (state.status == CommonScreenState.loading)
                        Utils.loaderWid(),
                    ],
                  ),
                );
              },
            );
        },
      ),
    );
  }
}
