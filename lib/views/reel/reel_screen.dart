import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:santvani_app/bloc/reel/reel_bloc.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/utils.dart';
import 'widget/reel_item_widget.dart';
import 'widget/create_reel_sheet.dart';

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Reels',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 28),
            onPressed: () => _pickAndUploadReel(context),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<ReelBloc, ReelState>(
        listener: (final BuildContext context, final ReelState state) {
          if (state.status == CommonScreenState.error && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFFD32F2F),
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        builder: (final BuildContext context, final ReelState state) {
          if (state.status == CommonScreenState.loading && state.reels.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF9933),
              ),
            );
          }

          if (state.reels.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.movie_creation_outlined,
                    size: 64,
                    color: Colors.white30,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'No reels available. 🙏',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            );
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.reels.length,
            itemBuilder: (final BuildContext context, final int index) {
              return ReelItemWidget(reel: state.reels[index]);
            },
          );
        },
      ),
    );
  }

  Future<void> _pickAndUploadReel(final BuildContext context) async {
    final PermissionStatus status = await Utils.checkPhotosPermission(context);
    if (status.isGranted || status.isLimited) {
      final XFile? media = await Utils.pickVideo(PhotoPickerType.photos);
      if (media != null && context.mounted) {
        final VideoPlayerController tempController = VideoPlayerController.file(File(media.path));
        try {
          await tempController.initialize();
          final Duration duration = tempController.value.duration;
          await tempController.dispose();

          if (duration.inSeconds > 20) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color(0xFFD32F2F),
                  content: Text('Video duration must be under 20 seconds! 🌸'),
                ),
              );
            }
            return;
          }
        } catch (e) {
          debugPrint('Error checking video duration: $e');
        }

        context.read<ReelBloc>().add(ReelEvent.onSelectVideo(videoPath: media.path));
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          useRootNavigator: true,
          builder: (final BuildContext sheetContext) {
            return BlocProvider.value(
              value: context.read<ReelBloc>(),
              child: const CreateReelSheet(),
            );
          },
        );
      }
    }
  }
}
