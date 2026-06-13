import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/reel/reel_bloc.dart';
import 'package:santvani_app/bloc/category/category_bloc.dart';
import 'package:santvani_app/data/models/category/category_model.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';
import 'package:santvani_app/utils/app_enums.dart';
import 'package:santvani_app/utils/utils.dart';

class CreateReelSheet extends StatefulWidget {
  const CreateReelSheet({super.key});

  @override
  State<CreateReelSheet> createState() => _CreateReelSheetState();
}

class _CreateReelSheetState extends State<CreateReelSheet> {
  final TextEditingController _captionController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<ReelBloc, ReelState>(
      listener: (final BuildContext context, final ReelState state) {
        if (state.status == CommonScreenState.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xFFE65100),
              content: Text('Reel shared successfully! 🌸🙏'),
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (final BuildContext context, final ReelState state) {
        final ReelBloc bloc = context.read<ReelBloc>();
        final bool isLoading = state.status == CommonScreenState.loading;
        final List<CategoryModel> categories = context
            .read<CategoryBloc>()
            .state
            .categories
            .where((final CategoryModel cat) => cat.name.toLowerCase() != 'all')
            .toList();

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New Reel',
                    style: dMSansW700.copyWith(fontSize: 18, color: const Color(0xFFE65100)),
                  ),
                  TextButton(
                    onPressed: isLoading ? null : () => bloc.add(const ReelEvent.onSubmitReel()),
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
              const SizedBox(height: 16),
              Text(
                'Select Category 🌸',
                style: dMSansW700.copyWith(fontSize: 13, color: const Color(0xFFE65100)),
              ),
              const SizedBox(height: 10),
              if (categories.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categories.map((final CategoryModel cat) {
                    final bool isSelected = state.category == cat.name;
                    return GestureDetector(
                      onTap: isLoading
                          ? null
                          : () => bloc.add(ReelEvent.onCategoryChanged(category: cat.name)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: isSelected
                              ? const LinearGradient(
                                  colors: <Color>[
                                    Color(0xFFFFD700),
                                    Color(0xFFFF9933),
                                  ],
                                )
                              : null,
                          color: isSelected ? null : const Color(0xFFFFFDF6),
                          border: isSelected
                              ? null
                              : Border.all(
                                  color: const Color(0xFFFFCC80).withValues(alpha: 0.5),
                                  width: 1.2,
                                ),
                        ),
                        child: Text(
                          cat.name,
                          style: dMSansW700.copyWith(
                            fontSize: 12,
                            color: isSelected ? Colors.white : const Color(0xFF5D4037),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 20),
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
                  maxLines: 3,
                  onChanged: (final String val) => bloc.add(ReelEvent.onCaptionChanged(caption: val)),
                  style: dMSansW500.copyWith(fontSize: 14, color: AppColors.colorNeutral900),
                  decoration: const InputDecoration(
                    hintText: 'Write a devotional caption... 🙏🌸',
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (isLoading) ...<Widget>[
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Utils.loaderWid(),
                      const SizedBox(width: 12),
                      Text(
                        'Uploading Reel...',
                        style: dMSansW500.copyWith(color: const Color(0xFFE65100)),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
