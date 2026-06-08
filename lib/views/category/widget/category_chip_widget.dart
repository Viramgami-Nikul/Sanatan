import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/bloc/category/category_bloc.dart';
import 'package:santvani_app/data/models/category/category_model.dart';
import 'package:santvani_app/theme/font_styles.dart';

class CategoryChipWidget extends StatelessWidget {
  const CategoryChipWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (final BuildContext context, final CategoryState state) {
        if (state.categories.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 54,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            itemCount: state.categories.length,
            itemBuilder: (final BuildContext context, final int index) {
              final CategoryModel category = state.categories[index];
              final bool isSelected = state.selectedCategory.toLowerCase() == category.name.toLowerCase();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    context.read<CategoryBloc>().add(
                      CategoryEvent.selectCategory(categoryName: category.name),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
                              color: const Color(0xFFFFCC80).withValues(alpha: 0.4),
                              width: 1.2,
                            ),
                      boxShadow: isSelected
                          ? <BoxShadow>[
                              BoxShadow(
                                color: const Color(0xFFFF9933).withValues(alpha: 0.3),
                                blurRadius: 8,
                                spreadRadius: 1,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        category.name,
                        style: dMSansW700.copyWith(
                          fontSize: 12.5,
                          color: isSelected ? Colors.white : const Color(0xFF5D4037),
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
