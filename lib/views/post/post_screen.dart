import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';
import 'package:santvani_app/bloc/post/post_bloc.dart';
import 'package:santvani_app/components/bottom_sheet/image_picker_option_bottom_sheet.dart';
import 'package:santvani_app/data/repository/post_repo.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/utils.dart';
import 'package:santvani_app/bloc/tab_navigation_cubit.dart';
import 'package:santvani_app/bloc/category/category_bloc.dart';
import 'package:santvani_app/data/models/category/category_model.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _captionController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  void _showImageSourceSheet(final BuildContext context, final PostBloc bloc) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (final BuildContext ccontext) {
        return ImagePickerOptionBottomSheet(
          onTapCamera: () async {
            final PermissionStatus status = await Utils.checkCameraPermission(ccontext);
            if (status.isGranted) {
              final XFile? media = await Utils.pickImage(PhotoPickerType.camera);
              if (media != null) {
                bloc.add(OnSelectImage(imagePath: media.path));
              }
            }
          },
          onTapGallery: () async {
            final PermissionStatus status = await Utils.checkPhotosPermission(ccontext);
            if (status.isGranted || status.isLimited) {
              final XFile? media = await Utils.pickImage(PhotoPickerType.photos);
              if (media != null) {
                bloc.add(OnSelectImage(imagePath: media.path));
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (final BuildContext ctx) => PostBloc(postRepo: ctx.read<PostRepo>()),
      child: BlocConsumer<PostBloc, PostState>(
        listener: (final BuildContext ctx, final PostState state) {
          if (state.status == CommonScreenState.success) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              const SnackBar(
                backgroundColor: Color(0xFFE65100),
                content: Text('Post shared successfully! 🌸🙏'),
              ),
            );
            // Switch navigation tab globally to Profile page (tab index 4)
            ctx.read<TabNavigationCubit>().updateTab(4);
            // Re-fetch user profile to sync the post count instantly!
            ctx.read<ProfileBloc>().add(const OnGetUserProfile());
            Navigator.pop(ctx);
          } else if (state.status == CommonScreenState.error && state.errorMessage != null) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.colorError500,
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        builder: (final BuildContext ctx, final PostState state) {
          final PostBloc bloc = ctx.read<PostBloc>();
          final bool isLoading = state.status == CommonScreenState.loading;
          final List<CategoryModel> categories = ctx
              .read<CategoryBloc>()
              .state
              .categories
              .where((final CategoryModel cat) => cat.name.toLowerCase() != 'all')
              .toList();

          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0.8,
              shadowColor: const Color(0xFFFF9933).withValues(alpha: 0.15),
              leading: IconButton(
                icon: const Icon(Icons.close_rounded, color: Color(0xFFE65100), size: 26),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'New Post',
                style: dMSansW700.copyWith(color: const Color(0xFFE65100), fontSize: 18),
              ),
              centerTitle: true,
              actions: <Widget>[
                TextButton(
                  onPressed: isLoading ? null : () => bloc.add(const OnSubmitPost()),
                  child: Text(
                    'Share',
                    style: dMSansW700.copyWith(
                      color: isLoading ? AppColors.colorNeutral400 : const Color(0xFFE65100),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      GestureDetector(
                        onTap: isLoading ? null : () => _showImageSourceSheet(context, bloc),
                        child: Container(
                          height: 240,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFDF6),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFFFCC80), width: 1.2),
                          ),
                          child: state.imagePath.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.add_photo_alternate_outlined, size: 48, color: Color(0xFFE65100)),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Select an image to post 🌸',
                                      style: dMSansW600.copyWith(fontSize: 14, color: const Color(0xFFE65100)),
                                    ),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.file(
                                    File(state.imagePath),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Select Category 🌸',
                        style: dMSansW700.copyWith(fontSize: 13, color: const Color(0xFFE65100)),
                      ),
                      const SizedBox(height: 10),
                      if (categories.isEmpty)
                        const SizedBox.shrink()
                      else
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: categories.map((final CategoryModel cat) {
                            final bool isSelected = state.category == cat.name;
                            return GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () => bloc.add(PostEvent.onCategoryChanged(category: cat.name)),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: isSelected
                                      ? const LinearGradient(
                                          colors: <Color>[
                                            Color(0xFFFFD700), // Divine Gold
                                            Color(0xFFFF9933), // Radiant Saffron
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )
                                      : null,
                                  color: isSelected ? null : const Color(0xFFFFFDF6),
                                  border: isSelected
                                      ? null
                                      : Border.all(
                                          color: const Color(0xFFFFCC80).withValues(alpha: 0.5),
                                          width: 1.2,
                                        ),
                                  boxShadow: isSelected
                                      ? <BoxShadow>[
                                          BoxShadow(
                                            color: const Color(0xFFFF9933).withValues(alpha: 0.25),
                                            blurRadius: 6,
                                            spreadRadius: 1,
                                            offset: const Offset(0, 2),
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    if (isSelected) ...<Widget>[
                                      const Icon(
                                        Icons.check_circle_rounded,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 6),
                                    ],
                                    Text(
                                      cat.name,
                                      style: dMSansW700.copyWith(
                                        fontSize: 12,
                                        color: isSelected ? Colors.white : const Color(0xFF5D4037),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      const SizedBox(height: 28),
                      Text(
                        'Caption',
                        style: dMSansW700.copyWith(fontSize: 13, color: const Color(0xFFE65100)),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
                        ),
                        child: TextField(
                          controller: _captionController,
                          maxLines: 4,
                          onChanged: (final val) => bloc.add(OnCaptionChanged(caption: val)),
                          style: dMSansW500.copyWith(fontSize: 14, color: AppColors.colorNeutral900),
                          decoration: const InputDecoration(
                            hintText: 'Write a devotional caption... 🙏🌸',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLoading)
                  Container(
                    color: Colors.black.withValues(alpha: 0.1),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Utils.loaderBrier(),
                          Utils.loaderWid(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
