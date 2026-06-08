part of 'category_bloc.dart';

@freezed
abstract class CategoryState
    with _$CategoryState {
  factory CategoryState({
    required CommonScreenState status,
    required List<CategoryModel> categories,
    required String selectedCategory,
    required List<PostModel> posts,
    String? errorMessage,
  }) = _CategoryState;

  factory CategoryState.initial() {
    return CategoryState(
      status: CommonScreenState.initial,
      categories: const <CategoryModel>[],
      selectedCategory: 'All',
      posts: const <PostModel>[],
      errorMessage: null,
    );
  }
}
