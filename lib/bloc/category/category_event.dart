part of 'category_bloc.dart';

@freezed
abstract class CategoryEvent
    with _$CategoryEvent {
  const factory CategoryEvent.loadCategories() = LoadCategories;

  const factory CategoryEvent.selectCategory({
    required String categoryName,
  }) = SelectCategory;
}
