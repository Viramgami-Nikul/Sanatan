import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/bloc/setting/setting_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/views/setting/widget/setting_list_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
    context.read<SettingBloc>().add(SettingEvent.onLoadSettings(userId: currentUserId));
  }

  @override
  Widget build(final BuildContext context) {
    final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

    return MultiBlocListener(
      listeners: <BlocListener<dynamic, dynamic>>[
        BlocListener<ProfileBloc, ProfileState>(
          listener: (final BuildContext ctx, final ProfileState state) {
            if (state.navigateToLogin == true) {
              context.read<ProfileBloc>().navigateToLoginScreen(ctx);
            }
          },
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: lightStatusBarTransparent,
        child: Scaffold(
          backgroundColor: const Color(0xFFFCF8F2),
          appBar: AppBar(
            backgroundColor: const Color(0xFFFCF8F2),
            elevation: 0.8,
            shadowColor: const Color(0xFFFF9933).withValues(alpha: 0.15),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFFE65100),
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Settings',
              style: dMSansW700.copyWith(color: const Color(0xFFE65100), fontSize: 18),
            ),
            centerTitle: true,
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
          body: SafeArea(
            child: BlocBuilder<SettingBloc, SettingState>(
              builder: (final BuildContext ctx, final SettingState state) {
                if (state.status == CommonScreenState.loading && state.settings == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFE65100),
                    ),
                  );
                }
                
                if (state.status == CommonScreenState.error && state.settings == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 48),
                        const SizedBox(height: 16),
                        Text(
                          state.errorMessage ?? 'Failed to load settings',
                          style: dMSansW600.copyWith(color: Colors.redAccent, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE65100),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            ctx.read<SettingBloc>().add(SettingEvent.onLoadSettings(userId: currentUserId));
                          },
                          child: Text(
                            'Retry',
                            style: dMSansW700.copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Stack(
                  children: <Widget>[
                    const SettingListWidget(),
                    if (state.status == CommonScreenState.loading)
                      Container(
                        color: Colors.black.withValues(alpha: 0.05),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFE65100),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
