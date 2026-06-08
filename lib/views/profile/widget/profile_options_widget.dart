import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/utils/utils.dart';

import 'package:santvani_app/bloc/user/profile_bloc.dart';

import 'package:santvani_app/views/profile/widget/profile_cell_widget.dart';

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (
          final BuildContext context,
          final ProfileState state,
          ) {
        final ProfileBloc bloc =
        context.read<ProfileBloc>();

        return ListView.separated(
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          itemCount:
          bloc.arrProfileOptions.length,

          itemBuilder: (
              final BuildContext context,
              final int index,
              ) {
            return ProfileCell(
              item:
              bloc.arrProfileOptions[index],
            );
          },

          separatorBuilder: (
              final BuildContext context,
              final int index,
              ) {
            return 14.h;
          },
        );
      },
    );
  }
}
