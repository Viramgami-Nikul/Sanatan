import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/category/category_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<PostModel>>> getPostsByCategory({required String categoryName});
}
