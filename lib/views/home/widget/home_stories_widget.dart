import 'package:flutter/material.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class StoryData {
  const StoryData({
    required this.username,
    required this.imageUrl,
    this.isYourStory = false,
    this.isLive = false,
  });

  final String username;
  final String imageUrl;
  final bool isYourStory;
  final bool isLive;
}

class HomeStoriesWidget extends StatelessWidget {
  const HomeStoriesWidget({
    super.key,
    required this.followedUsers,
  });

  final List<UserDataModel> followedUsers;

  static const List<StoryData> _mockStories = <StoryData>[
    StoryData(
      username: 'bhajanmarg_official',
      imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=150&q=80',
    ),
    StoryData(
      username: 'dp_official_999',
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
    ),
    StoryData(
      username: 'amanxnayak',
      imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
    ),
    StoryData(
      username: 'crickpalof',
      imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=150&q=80',
    ),
    StoryData(
      username: 'radhe_krish',
      imageUrl: 'https://images.unsplash.com/photo-1607990283143-e81e7a2c93ab?auto=format&fit=crop&w=150&q=80',
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    final String? userPhotoUrl = SharedPreferenceHelper().user?.userProfileImageUrl;
    final List<StoryData> stories = <StoryData>[
      StoryData(
        username: 'Your story',
        imageUrl: userPhotoUrl ?? 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
        isYourStory: true,
      ),
      if (followedUsers.isEmpty)
        ..._mockStories
      else
        ...followedUsers.map((final UserDataModel u) {
          return StoryData(
            username: u.username ?? u.fullName,
            imageUrl: u.profileImage ?? u.photoUrl ?? 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=150&q=80',
          );
        }),
    ];

    return Container(
      height: 142,
      decoration: const BoxDecoration(
        color: Color(0xFFFCF8F2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 12.0, bottom: 4.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 5,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9933),
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Daily Darshan & Guides',
                  style: dMSansW700.copyWith(
                    fontSize: 13,
                    color: const Color(0xFFE65100), // Serene Saffron title
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              itemCount: stories.length,
              itemBuilder: (final BuildContext context, final int index) {
                return _StoryItem(story: stories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({required this.story});
  final StoryData story;

  @override
  Widget build(final BuildContext context) {
    final String? fullName = SharedPreferenceHelper().user?.fullName;
    final String firstName = (fullName ?? 'User').split(' ').first;
    final String displayName = story.isYourStory ? 'Your story' : story.username;
    final String? userPhotoUrl = SharedPreferenceHelper().user?.userProfileImageUrl;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              if (story.isYourStory)
                // Your Story Circle styled inside a warm saffron-gold boundary
                Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFFCC80),
                      width: 1.5,
                    ),
                    color: const Color(0xFFFFF3E0),
                  ),
                  child: userPhotoUrl != null && userPhotoUrl.isNotEmpty
                      ? CircleAvatar(
                          radius: 27,
                          backgroundColor: const Color(0xFFFFE0B2),
                          backgroundImage: NetworkImage(userPhotoUrl),
                        )
                      : CircleAvatar(
                          radius: 27,
                          backgroundColor: const Color(0xFFFFE0B2),
                          child: Text(
                            firstName.isNotEmpty ? firstName[0].toUpperCase() : 'U',
                            style: dMSansW700.copyWith(
                              fontSize: 20,
                              color: const Color(0xFFE65100),
                            ),
                          ),
                        ),
                )
              else
                // Styled Gradient Border Ring for other users (Divine Halos)
                Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: const Color(0xFFFF9933).withValues(alpha: 0.18),
                        blurRadius: 6,
                        spreadRadius: 0.5,
                        offset: const Offset(0, 2),
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
                      radius: 24.5,
                      backgroundColor: AppColors.colorNeutral200,
                      backgroundImage: NetworkImage(story.imageUrl),
                    ),
                  ),
                ),
              if (story.isYourStory)
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFE65100).withValues(alpha: 0.3),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 7.5,
                      backgroundColor: Color(0xFFE65100), // Saffron add icon
                      child: Icon(
                        Icons.add_rounded,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 72,
            child: Text(
              displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: dMSansW600.copyWith(
                fontSize: 10,
                color: const Color(0xFF5D4037), // Meditative dark warm brown
                letterSpacing: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
