import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/category/category_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('category').get();
      if (snapshot.docs.isEmpty) {
        // Seed the collection with default categories
        final List<String> defaultCategoryNames = <String>[
          'All',
          'Bhajan',
          'Satsang',
          'Kirtan',
          'Pravachan',
          'Aarti',
          'Temple',
          'Festivals',
        ];

        final WriteBatch batch = _firestore.batch();
        for (final String name in defaultCategoryNames) {
          final DocumentReference docRef = _firestore.collection('category').doc(name.toLowerCase());
          final CategoryModel cat = CategoryModel(
            id: name.toLowerCase(),
            name: name,
          );
          batch.set(docRef, cat.toJson());
        }
        await batch.commit();

        // Fetch again after seeding
        final QuerySnapshot seededSnapshot = await _firestore.collection('category').get();
        final List<CategoryModel> seededCategories = seededSnapshot.docs.map((final doc) {
          return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();

        // Sort to preserve a specific order (All first, then the rest)
        _sortCategories(seededCategories);
        return Right(seededCategories);
      }

      final List<CategoryModel> categories = snapshot.docs.map((final doc) {
        return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      _sortCategories(categories);
      return Right(categories);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  void _sortCategories(final List<CategoryModel> list) {
    final List<String> order = <String>[
      'all',
      'bhajan',
      'satsang',
      'kirtan',
      'pravachan',
      'aarti',
      'temple',
      'festivals',
    ];
    list.sort((final a, final b) {
      final int indexA = order.indexOf(a.id);
      final int indexB = order.indexOf(b.id);
      if (indexA == -1 && indexB == -1) return a.name.compareTo(b.name);
      if (indexA == -1) return 1;
      if (indexB == -1) return -1;
      return indexA.compareTo(indexB);
    });
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPostsByCategory({required final String categoryName}) async {
    try {
      final QuerySnapshot querySnapshot = await _firestore.collection('post').get();
      final List<PostModel> posts = querySnapshot.docs.map((final doc) {
        return PostModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      if (categoryName.toLowerCase() != 'all') {
        posts.retainWhere((final post) {
          final String postCategory = (post.category ?? '').toLowerCase();
          final String targetCategory = categoryName.toLowerCase();
          if (postCategory == targetCategory) {
            return true;
          }
          final String caption = post.caption.toLowerCase();
          return caption.contains('#$targetCategory') || caption.contains(targetCategory);
        });
      }

      // Sort posts in memory by createdAt descending
      posts.sort((final a, final b) {
        final dynamic aTime = a.createdAt;
        final dynamic bTime = b.createdAt;
        
        if (aTime == null && bTime == null) return 0;
        if (aTime == null) return -1;
        if (bTime == null) return 1;
        
        DateTime? aDate;
        DateTime? bDate;
        if (aTime is Timestamp) {
          aDate = aTime.toDate();
        } else if (aTime is DateTime) {
          aDate = aTime;
        }
        
        if (bTime is Timestamp) {
          bDate = bTime.toDate();
        } else if (bTime is DateTime) {
          bDate = bTime;
        }
        
        if (aDate == null && bDate == null) return 0;
        if (aDate == null) return -1;
        if (bDate == null) return 1;
        return bDate.compareTo(aDate);
      });

      return Right(posts);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
