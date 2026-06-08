import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/components/bottom_sheet/bottom_sheet_drag_line.dart';
import 'package:santvani_app/data/repository/post_repo.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class PostOptionsBottomSheet extends StatefulWidget {
  const PostOptionsBottomSheet({
    super.key,
    required this.postId,
    required this.currentCaption,
    required this.onDeleteSuccess,
    required this.onEditSuccess,
  });

  final String postId;
  final String currentCaption;
  final VoidCallback onDeleteSuccess;
  final ValueChanged<String> onEditSuccess;

  @override
  State<PostOptionsBottomSheet> createState() => _PostOptionsBottomSheetState();
}

class _PostOptionsBottomSheetState extends State<PostOptionsBottomSheet> {
  bool _isLoading = false;

  void _showErrorSnackBar(final String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFD32F2F),
        content: Text(message),
      ),
    );
  }

  void _showSuccessSnackBar(final String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFE65100),
        content: Text(message),
      ),
    );
  }

  Future<void> _handleDelete() async {
    final postRepo = context.read<PostRepo>();

    // Show confirmation dialog first
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (final BuildContext dialogCtx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            backgroundColor: const Color(0xFFFCF8F2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: Text(
              'Delete Post',
              style: dMSansW700.copyWith(fontSize: 16, color: const Color(0xFF3E2723)),
            ),
            content: Text(
              'Are you sure you want to delete this spiritual post? This action cannot be undone. 🌸',
              style: dMSansW500.copyWith(fontSize: 13, color: const Color(0xFF5D4037)),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(dialogCtx, false),
                child: Text(
                  'Cancel',
                  style: dMSansW700.copyWith(color: const Color(0xFF8D6E63)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pop(dialogCtx, true),
                child: Text(
                  'Delete',
                  style: dMSansW700.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (confirm != true || !mounted) return;

    setState(() {
      _isLoading = true;
    });

    final result = await postRepo.deletePost(postId: widget.postId);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    result.fold(
      (final failure) {
        _showErrorSnackBar(failure.message ?? 'Failed to delete post');
      },
      (final _) {
        _showSuccessSnackBar('Post deleted successfully! 🌸🙏');
        context.read<ProfileBloc>().add(const OnGetUserProfile());
        Navigator.pop(context); // Close bottom sheet
        widget.onDeleteSuccess();
      },
    );
  }

  Future<void> _handleEdit() async {
    final TextEditingController controller = TextEditingController(text: widget.currentCaption);
    final postRepo = context.read<PostRepo>();

    final String? newCaption = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (final BuildContext dialogCtx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            backgroundColor: const Color(0xFFFCF8F2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: Text(
              'Edit Caption',
              style: dMSansW700.copyWith(fontSize: 16, color: const Color(0xFFE65100)),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: controller,
                maxLines: 4,
                style: dMSansW500.copyWith(fontSize: 13.5, color: const Color(0xFF3E2723)),
                decoration: InputDecoration(
                  hintText: 'Share some spiritual wisdom...',
                  hintStyle: dMSansW400.copyWith(fontSize: 12.5, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFFFFDF6),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFFF9933), width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFFFCC80), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(dialogCtx, null),
                child: Text(
                  'Cancel',
                  style: dMSansW700.copyWith(color: const Color(0xFF8D6E63)),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE65100),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pop(dialogCtx, controller.text),
                child: Text(
                  'Save',
                  style: dMSansW700.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (newCaption == null || !mounted) return;

    setState(() {
      _isLoading = true;
    });

    final result = await postRepo.updatePostCaption(
      postId: widget.postId,
      caption: newCaption,
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    result.fold(
      (final failure) {
        _showErrorSnackBar(failure.message ?? 'Failed to update caption');
      },
      (final _) {
        _showSuccessSnackBar('Caption updated successfully! 🌸🙏');
        Navigator.pop(context); // Close bottom sheet
        widget.onEditSuccess(newCaption);
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const BottomSheetDragLine(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Post Options',
                        style: dMSansW700.copyWith(
                          fontSize: 18,
                          color: const Color(0xFFE65100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildOptionItem(
                      context,
                      icon: Icons.edit_outlined,
                      label: 'Edit Caption',
                      color: const Color(0xFFE65100),
                      onTap: () => _handleEdit(),
                    ),
                    _buildDivider(),
                    _buildOptionItem(
                      context,
                      icon: Icons.delete_outline_rounded,
                      label: 'Delete Post',
                      color: const Color(0xFFD32F2F),
                      onTap: () => _handleDelete(),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ],
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.2),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE65100),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(
    final BuildContext context, {
    required final IconData icon,
    required final String label,
    required final Color color,
    required final VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 24,
              color: color,
            ),
            const SizedBox(width: 18),
            Text(
              label,
              style: dMSansW500.copyWith(
                fontSize: 15,
                color: color == const Color(0xFFD32F2F) ? color : AppColors.colorNeutral800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 0.8,
      color: const Color(0xFFFFCC80).withValues(alpha: 0.25),
      indent: 42,
    );
  }
}
