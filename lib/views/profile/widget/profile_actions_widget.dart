import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/theme/font_styles.dart';

class ProfileActionsWidget extends StatelessWidget {
  const ProfileActionsWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _actionButton('Edit profile', () {
              context.read<ProfileBloc>().navigateToProfileDetails(context);
            }),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _actionButton('Share profile', () {}),
          ),
          const SizedBox(width: 10),
          Container(
            width: 40,
            height: 36,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFFFFFDF6),
                  Color(0xFFFFF3E0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFCC80), width: 1.2),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFFF9933).withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.person_add_rounded, size: 18, color: Color(0xFFE65100)),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(final String label, final VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xFFFFFDF6),
              Color(0xFFFFF3E0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFFFCC80), width: 1.2),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFFFF9933).withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: dMSansW700.copyWith(
            fontSize: 12,
            color: const Color(0xFFE65100),
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
