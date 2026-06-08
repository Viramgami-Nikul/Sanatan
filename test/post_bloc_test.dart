import 'package:flutter_test/flutter_test.dart';
import 'package:santvani_app/bloc/post/post_bloc.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'package:santvani_app/data/repository/post_repo.dart';
import 'package:santvani_app/utils/app_enums.dart';

class FakePostRepo extends PostRepo {
  String? lastLocalImagePath;
  String? lastCaption;
  String? lastCategory;

  @override
  Future<Either<Failure, PostModel>> createPost({
    required String localImagePath,
    required String caption,
    String? category,
  }) async {
    lastLocalImagePath = localImagePath;
    lastCaption = caption;
    lastCategory = category;
    return Right(PostModel(
      postId: 'test-post-id',
      uid: 'test-uid',
      imageUrl: 'http://test.com/image.jpg',
      caption: caption,
      likesCount: 0,
      commentsCount: 0,
      createdAt: DateTime.now(),
      category: category,
    ));
  }

  @override
  Future<Either<Failure, List<PostModel>>> getUserPosts({required String uid}) async {
    return const Right(<PostModel>[]);
  }

  @override
  Future<Either<Failure, void>> deletePost({required String postId}) async {
    return const Right<Failure, void>(null);
  }

  @override
  Future<Either<Failure, void>> updatePostCaption({
    required String postId,
    required String caption,
  }) async {
    return const Right<Failure, void>(null);
  }
}

void main() {
  late FakePostRepo fakePostRepo;
  late PostBloc postBloc;

  setUp(() {
    fakePostRepo = FakePostRepo();
    postBloc = PostBloc(postRepo: fakePostRepo);
  });

  tearDown(() {
    postBloc.close();
  });

  test('initial state has null category', () {
    expect(postBloc.state.category, isNull);
    expect(postBloc.state.status, CommonScreenState.initial);
  });

  test('onCategoryChanged updates category in state', () async {
    postBloc.add(const PostEvent.onCategoryChanged(category: 'Temple'));
    await expectLater(
      postBloc.stream,
      emits(predicate<PostState>((state) => state.category == 'Temple')),
    );
  });

  test('onSubmitPost validates image path and category', () async {
    // 1. Submit with empty image and no category -> should fail with please select an image
    postBloc.add(const PostEvent.onSubmitPost());
    await expectLater(
      postBloc.stream,
      emits(predicate<PostState>((state) =>
          state.status == CommonScreenState.error &&
          state.errorMessage == 'Please select an image')),
    );

    // 2. Select image, but no category -> should fail with please select a category
    postBloc.add(const OnSelectImage(imagePath: 'test_path.jpg'));
    postBloc.add(const PostEvent.onSubmitPost());
    await expectLater(
      postBloc.stream,
      emitsInOrder([
        predicate<PostState>((state) => state.imagePath == 'test_path.jpg'),
        predicate<PostState>((state) =>
            state.status == CommonScreenState.error &&
            state.errorMessage == 'Please select a category'),
      ]),
    );

    // 3. Select category and submit -> should succeed
    postBloc.add(const PostEvent.onCategoryChanged(category: 'Temple'));
    postBloc.add(const PostEvent.onSubmitPost());
    await expectLater(
      postBloc.stream,
      emitsInOrder([
        predicate<PostState>((state) => state.category == 'Temple'),
        predicate<PostState>((state) => state.status == CommonScreenState.loading),
        predicate<PostState>((state) => state.status == CommonScreenState.success),
      ]),
    );

    expect(fakePostRepo.lastLocalImagePath, 'test_path.jpg');
    expect(fakePostRepo.lastCategory, 'Temple');
  });
}
