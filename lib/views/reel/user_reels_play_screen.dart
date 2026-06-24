import 'package:flutter/material.dart';
import 'package:santvani_app/data/models/reel/reel_model.dart';
import 'package:santvani_app/views/reel/widget/reel_item_widget.dart';

class UserReelsPlayScreen extends StatefulWidget {
  const UserReelsPlayScreen({
    super.key,
    required this.reels,
    required this.initialIndex,
  });

  final List<ReelModel> reels;
  final int initialIndex;

  @override
  State<UserReelsPlayScreen> createState() => _UserReelsPlayScreenState();
}

class _UserReelsPlayScreenState extends State<UserReelsPlayScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: widget.reels.length,
            itemBuilder: (final BuildContext context, final int index) {
              return ReelItemWidget(reel: widget.reels[index]);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
