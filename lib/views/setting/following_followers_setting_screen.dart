// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/setting/setting_bloc.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/theme/status_bar_config.dart';
import 'package:santvani_app/utils/app_enums.dart';

class FollowingFollowersSettingScreen extends StatefulWidget {
  const FollowingFollowersSettingScreen({super.key});

  @override
  State<FollowingFollowersSettingScreen> createState() => _FollowingFollowersSettingScreenState();
}

class _FollowingFollowersSettingScreenState extends State<FollowingFollowersSettingScreen> {
  Widget _buildSectionHeader(final String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 8),
      child: Text(
        title,
        style: dMSansW700.copyWith(
          fontSize: 16,
          color: const Color(0xFF3E2723),
        ),
      ),
    );
  }

  Widget _buildOptionRow({
    required final String title,
    required final String value,
    required final String groupValue,
    required final ValueChanged<String?> onChanged,
  }) {
    final bool isSelected = value == groupValue;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      dense: true,
      title: Text(
        title,
        style: dMSansW500.copyWith(
          fontSize: 15,
          color: isSelected ? const Color(0xFF3E2723) : const Color(0xFF5D4037),
        ),
      ),
      trailing: Radio<String>(
        value: value,
        groupValue: groupValue,
        activeColor: const Color(0xFFE65100),
        fillColor: WidgetStateProperty.resolveWith<Color>((final Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const Color(0xFFE65100);
          }
          return const Color(0xFF8D6E63).withValues(alpha: 0.6);
        }),
        onChanged: onChanged,
      ),
      onTap: () => onChanged(value),
    );
  }

  Widget _buildSectionSubtext(final String subtext) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 16),
      child: Text(
        subtext,
        style: dMSansW400.copyWith(
          fontSize: 12.5,
          color: const Color(0xFF8D6E63),
          height: 1.3,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: lightStatusBarTransparent,
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (final BuildContext context, final SettingState state) {
          final settings = state.settings;
          final followerRequests = settings?.followerRequests ?? 'On';
          final acceptedFollowRequests = settings?.acceptedFollowRequests ?? 'On';
          final accountSuggestions = settings?.accountSuggestions ?? 'On';
          final mentionsInBio = settings?.mentionsInBio ?? 'From everyone';

          return Scaffold(
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
                'Following and followers',
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
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // 1. Follower requests
                        _buildSectionHeader('Follower requests'),
                        _buildOptionRow(
                          title: 'Off',
                          value: 'Off',
                          groupValue: followerRequests,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateFollowerRequests(value: val));
                            }
                          },
                        ),
                        _buildOptionRow(
                          title: 'On',
                          value: 'On',
                          groupValue: followerRequests,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateFollowerRequests(value: val));
                            }
                          },
                        ),
                        _buildSectionSubtext('John Appleseed (johnappleseed) has requested to follow you.'),
                        const Divider(height: 1, color: Color(0xFFFFF3E0)),

                        // 2. Accepted follow requests

                        _buildSectionHeader('Accepted follow requests'),
                        _buildOptionRow(
                          title: 'Off',
                          value: 'Off',
                          groupValue: acceptedFollowRequests,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateAcceptedFollowRequests(value: val));
                            }
                          },
                        ),
                        _buildOptionRow(
                          title: 'On',
                          value: 'On',
                          groupValue: acceptedFollowRequests,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateAcceptedFollowRequests(value: val));
                            }
                          },
                        ),
                        _buildSectionSubtext('John Appleseed (johnappleseed) accepted your follow request.'),
                        const Divider(height: 1, color: Color(0xFFFFF3E0)),

                        // 3. Account suggestions
                        _buildSectionHeader('Account suggestions'),
                        _buildOptionRow(
                          title: 'Off',
                          value: 'Off',
                          groupValue: accountSuggestions,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateAccountSuggestions(value: val));
                            }
                          },
                        ),
                        _buildOptionRow(
                          title: 'On',
                          value: 'On',
                          groupValue: accountSuggestions,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateAccountSuggestions(value: val));
                            }
                          },
                        ),
                        _buildSectionSubtext('johnappleseed, who you might know, is on Santvani, and other similar notifications.'),
                        const Divider(height: 1, color: Color(0xFFFFF3E0)),

                        // 4. Mentions in bio
                        _buildSectionHeader('Mentions in bio'),
                        _buildOptionRow(
                          title: 'Off',
                          value: 'Off',
                          groupValue: mentionsInBio,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateMentionsInBio(value: val));
                            }
                          },
                        ),
                        _buildOptionRow(
                          title: 'From profiles I follow',
                          value: 'From profiles I follow',
                          groupValue: mentionsInBio,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateMentionsInBio(value: val));
                            }
                          },
                        ),
                        _buildOptionRow(
                          title: 'From everyone',
                          value: 'From everyone',
                          groupValue: mentionsInBio,
                          onChanged: (final String? val) {
                            if (val != null) {
                              context.read<SettingBloc>().add(SettingEvent.onUpdateMentionsInBio(value: val));
                            }
                          },
                        ),
                        _buildSectionSubtext('johnappleseed mentioned you in their bio.'),
                        const Divider(height: 1, color: Color(0xFFFFF3E0)),

                        // 5. System settings link & disclaimer
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 8),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xFFE65100),
                                  content: Text('Opening system settings... 🌸🙏'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Text(
                              'Additional options in system settings...',
                              style: dMSansW600.copyWith(
                                fontSize: 15,
                                color: const Color(0xFF1976D2), // Beautiful interactive blue
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                          child: Text(
                            'These settings affect any Santvani accounts logged in to this device.',
                            style: dMSansW400.copyWith(
                              fontSize: 12.5,
                              color: const Color(0xFF8D6E63),
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
