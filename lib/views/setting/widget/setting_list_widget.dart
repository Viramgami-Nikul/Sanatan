import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/setting/setting_bloc.dart' hide OnChangeLanguage;
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/bloc/tab_navigation_cubit.dart';
import 'package:santvani_app/routes/routes_name.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/views/profile/widget/language_bottom_sheet.dart';
import 'package:santvani_app/views/profile/widget/logout_bottom_sheet.dart';
import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';

class SettingListWidget extends StatelessWidget {
  const SettingListWidget({super.key});

  void _showSnackBar(final BuildContext context, final String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFE65100),
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showLanguageSheet(final BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (final BuildContext ccontext) => LanguageBottomSheet(
        onTapChangeLanguage: (final value) {
          context.read<LocalisationBloc>().add(
            OnChangeLanguage(Locale(value.langCode, value.countryCode)),
          );
          context.read<SettingBloc>().add(
            SettingEvent.onChangeLanguage(language: value.langCode),
          );
        },
      ),
    );
  }

  void _showLogoutSheet(final BuildContext context) {
    showModalBottomSheet<void>(
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

  Widget _buildGroupTitle(final String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: dMSansW700.copyWith(
          fontSize: 11.5,
          color: const Color(0xFFFF9933),
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildCard(final List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFFE0B2).withValues(alpha: 0.4),
          width: 1.0,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFFFF9933).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile({
    required final IconData icon,
    required final String title,
    required final VoidCallback onTap,
    final Widget? trailing,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFFE65100), size: 20),
      ),
      title: Text(
        title,
        style: dMSansW600.copyWith(fontSize: 14, color: const Color(0xFF3E2723)),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF8D6E63)),
      onTap: onTap,
    );
  }

  @override
  Widget build(final BuildContext context) {
    final state = context.watch<SettingBloc>().state;
    final isNotificationsEnabled = state.settings?.isNotificationsEnabled ?? true;
    final isDarkMode = state.settings?.isDarkMode ?? false;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 12),
          _buildGroupTitle('Account Settings'),
          _buildCard(<Widget>[
            _buildTile(
              icon: Icons.person_outline_rounded,
              title: 'Edit Profile',
              onTap: () => Navigator.pushNamed(context, RouteName.profileDetailsScreen),
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.chat_bubble_outline_rounded,
              title: 'Messages',
              onTap: () {
                context.read<TabNavigationCubit>().updateTab(2);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.people_outline_rounded,
              title: 'Followers & Following',
              onTap: () => _showSnackBar(context, 'Followers & Following details... 🌸🙏'),
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.movie_filter_outlined,
              title: 'Saved Reels & Post',
              onTap: () => Navigator.pushNamed(context, RouteName.savedPostsScreen),
            ),
          ]),
          _buildGroupTitle('Preferences'),
          _buildCard(<Widget>[
            _buildTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
              trailing: Switch.adaptive(
                value: isNotificationsEnabled,
                activeColor: const Color(0xFFE65100),
                activeTrackColor: const Color(0xFFFFCC80),
                onChanged: (final value) {
                  context.read<SettingBloc>().add(SettingEvent.onToggleNotifications(isEnabled: value));
                },
              ),
              onTap: () {},
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              trailing: Switch.adaptive(
                value: isDarkMode,
                activeColor: const Color(0xFFE65100),
                activeTrackColor: const Color(0xFFFFCC80),
                onChanged: (final value) {
                  context.read<SettingBloc>().add(SettingEvent.onToggleDarkMode(isEnabled: value));
                },
              ),
              onTap: () {},
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.language_rounded,
              title: 'Language',
              onTap: () => _showLanguageSheet(context),
            ),
          ]),
          _buildGroupTitle('Support & Legal'),
          _buildCard(<Widget>[
            _buildTile(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
              onTap: () => _showSnackBar(context, 'Help & Support center... 🌸🙏'),
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.security_rounded,
              title: 'Privacy Policy',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.privacyPolicyScreen,
                  arguments: <String, dynamic>{
                    'policy': CMSPage.policy,
                  },
                );
              },
            ),
            const Divider(height: 1, color: Color(0xFFFFF3E0)),
            _buildTile(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.privacyPolicyScreen,
                  arguments: <String, dynamic>{
                    'policy': CMSPage.terms,
                  },
                );
              },
            ),
          ]),
          _buildGroupTitle('Account Actions'),
          _buildCard(<Widget>[
            _buildTile(
              icon: Icons.logout_rounded,
              title: 'Logout',
              onTap: () => _showLogoutSheet(context),
            ),
          ]),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
