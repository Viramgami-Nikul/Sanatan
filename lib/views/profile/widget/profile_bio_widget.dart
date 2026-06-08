import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/theme/font_styles.dart';

class ProfileBioWidget extends StatelessWidget {
  const ProfileBioWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (final BuildContext context, final ProfileState state) {
        final String fullName = state.userData?.fullName ?? 'Nikul Prajapati';
        final String bioText = state.userData?.bio ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF6), // Serene parchment background
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFFFE0B2).withValues(alpha: 0.5),
                width: 1,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFFF9933).withValues(alpha: 0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      fullName,
                      style: dMSansW700.copyWith(
                        fontSize: 13,
                        color: const Color(0xFF3E2723), // Deep chocolate
                      ),
                    ),
                    const Icon(
                      Icons.spa_rounded, // Serene Lotus decoration
                      size: 14,
                      color: Color(0xFFFFB300), // Glowing Gold
                    ),
                  ],
                ),
                if (bioText.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 6),
                  Text(
                    bioText,
                    style: dMSansW500.copyWith(
                      fontSize: 11.5,
                      color: const Color(0xFF5D4037), // Warm meditative brown
                      height: 1.35,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
