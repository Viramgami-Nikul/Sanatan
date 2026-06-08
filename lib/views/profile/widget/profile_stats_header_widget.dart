import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class ProfileStatsHeaderWidget extends StatelessWidget {
  const ProfileStatsHeaderWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (final BuildContext context, final ProfileState state) {
        final int postsCount = state.userData?.postsCount ?? 0;
        final int followersCount = state.userData?.followersCount ?? 0;
        final int followingCount = state.userData?.followingCount ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              // Profile Circle Avatar with vibe bubble and plus overlay
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      context.read<ProfileBloc>().add(OnTapEditProfilePhoto());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: const Color(0xFFFF9933).withValues(alpha: 0.22),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color(0xFFFFD700), // Gold
                            Color(0xFFFF9933), // Saffron
                            Color(0xFFFF3300), // Divine Vermilion
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFCF8F2),
                        ),
                        child: CircleAvatar(
                          radius: 38,
                          backgroundColor: AppColors.colorNeutral200,
                          backgroundImage: NetworkImage(
                            (state.userData?.profileImage != null && state.userData!.profileImage!.isNotEmpty)
                                ? state.userData!.profileImage!
                                : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
                          ),
                        ),
                      ),
                    ),
                  ),
                  // "Today's vibe..." Speech bubble
                  Positioned(
                    top: -16,
                    left: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0), // Warm spiritual cream background
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFFCC80), width: 0.8), // Saffron border line
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: const Color(0xFFFF9933).withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        "Today's vibe...",
                        style: dMSansW600.copyWith(fontSize: 8.5, color: const Color(0xFFE65100)), // Warm saffron text
                      ),
                    ),
                  ),
                  // Plus badge overlay
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1.5),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFCF8F2)),
                      child: const CircleAvatar(
                        radius: 8.5,
                        backgroundColor: Color(0xFFE65100), // Saffron badge color
                        child: Icon(Icons.add_rounded, size: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Stats Card - completely redesigned to be spiritual, not Instagram-like!
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFDF6), // Meditative card paper background
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFFFE0B2).withValues(alpha: 0.5),
                      width: 1,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: const Color(0xFFFF9933).withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _statColumn(postsCount.toString(), 'posts'),
                      _statColumn(followersCount.toString(), 'followers'),
                      _statColumn(followingCount.toString(), 'following'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _statColumn(final String value, final String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          value,
          style: dMSansW700.copyWith(
            fontSize: 15,
            color: const Color(0xFFE65100),
            height: 1.1,
          ), // Saffron numbers
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: dMSansW600.copyWith(
            fontSize: 10,
            color: const Color(0xFF8D6E63), // Meditative warm brown
          ),
        ),
      ],
    );
  }
}
