import 'package:flutter/material.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key, required this.post});

  final PostData post;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F2), // Serene parchment/sandstone background
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
          'Post Detail',
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 12),
              HomePostWidget(post: post),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
