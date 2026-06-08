import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/category/category_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'package:santvani_app/data/repository/category_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryBloc({required this.categoryRepo}) : super(CategoryState.initial()) {
    on<LoadCategories>((final event, final emit) async {
      emit(state.copyWith(status: CommonScreenState.loading));
      final Either<Failure, List<CategoryModel>> result = await categoryRepo.getCategories();
      await result.fold(
        (final failure) async {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final categories) async {
          emit(state.copyWith(
            status: CommonScreenState.loaded,
            categories: categories,
          ));
          // Load default posts for the 'All' category
          add(const CategoryEvent.selectCategory(categoryName: 'All'));
        },
      );
    });

    on<SelectCategory>((final event, final emit) async {
      emit(state.copyWith(
        selectedCategory: event.categoryName,
        status: CommonScreenState.loading,
      ));
      final Either<Failure, List<PostModel>> result = await categoryRepo.getPostsByCategory(
        categoryName: event.categoryName,
      );
      result.fold(
        (final failure) {
          emit(state.copyWith(
            status: CommonScreenState.error,
            errorMessage: failure.message,
          ));
        },
        (final posts) {
          emit(state.copyWith(
            status: CommonScreenState.success,
            posts: posts,
          ));
        },
      );
    });
  }
}
