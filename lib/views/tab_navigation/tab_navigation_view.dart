import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';
import 'package:santvani_app/bloc/tab_navigation_cubit.dart';

import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';

import 'package:santvani_app/views/home/home_screen.dart';
import 'package:santvani_app/views/profile/profile_screen.dart';
import 'package:santvani_app/views/search/search_screen.dart';
import 'package:santvani_app/views/chat/chat_screen.dart';

class TabNavigationView extends StatelessWidget {
  const TabNavigationView({
    super.key,
    this.initialTabIndex = 0,
  });

  final int initialTabIndex;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<LocalisationBloc, LocalisationState>(
      builder: (
        final BuildContext context,
        final LocalisationState state,
      ) {
        // Initialize the global cubit with the initial tab index
        context.read<TabNavigationCubit>().updateTab(initialTabIndex);

        return BlocBuilder<TabNavigationCubit, int>(
          builder: (final BuildContext context, final int currentIndex) {
            final TabNavigationCubit cubit = context.read<TabNavigationCubit>();
            return _tabBar(
              context,
              currentIndex,
              cubit,
            );
          },
        );
      },
    );
  }

  Widget _tabBar(
    final BuildContext context,
    final int currentIndex,
    final TabNavigationCubit cubit,
  ) {
    final String? userPhotoUrl = SharedPreferenceHelper().user?.userProfileImageUrl;
    final List<Widget> pages = <Widget>[
      const HomeScreen(),
      const Center(child: Text('Reels Feed')),
      ChatScreen(sharedPost: cubit.sharedPost),
      const SearchScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      extendBody: false, // Edge-to-edge bottom bar matches the image perfectly
      body: AnimatedSwitcher(
        duration: const Duration(
          milliseconds: 250,
        ),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: const Color(0xFFFF9933).withValues(alpha: 0.15), // Warm saffron shadow top line
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: AppColors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFFE65100), // Active saffron highlight color
          unselectedItemColor: AppColors.colorNeutral500, // Inactive neutral gray
          onTap: (final int index) {
            cubit.updateTab(index);
          },
          items: <BottomNavigationBarItem>[
            // 1. Home Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  currentIndex == 0
                      ? (Platform.isAndroid ? Icons.home_rounded : CupertinoIcons.house_fill)
                      : (Platform.isAndroid ? Icons.home_outlined : CupertinoIcons.house),
                  size: 27,
                ),
              ),
              label: '',
            ),

            // 2. Reels Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  currentIndex == 1 ? Icons.movie_creation : Icons.movie_creation_outlined,
                  size: 25,
                ),
              ),
              label: '',
            ),

            // 3. Messenger / Direct SOS Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Icon(
                      currentIndex == 2
                          ? (Platform.isAndroid ? Icons.send_rounded : CupertinoIcons.paperplane_fill)
                          : (Platform.isAndroid ? Icons.send_outlined : CupertinoIcons.paperplane),
                      size: 25,
                    ),
                    // High-priority notification badge representing messages/SOS alerts
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFB300), // Glowing Gold alert dot
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            ),

            // 4. Search Tab
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  currentIndex == 3 ? Icons.search : Icons.search_outlined,
                  size: 27,
                ),
              ),
              label: '',
            ),

            // 5. Profile Tab (Circle Avatar with active border)
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  padding: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: currentIndex == 4 ? const Color(0xFFE65100) : Colors.transparent, // Saffron active border
                      width: 1.5,
                    ),
                  ),  
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: AppColors.colorPrimary100,
                    backgroundImage: userPhotoUrl != null && userPhotoUrl.isNotEmpty
                        ? NetworkImage(userPhotoUrl)
                        : const NetworkImage(
                            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
                          ),
                  ),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
