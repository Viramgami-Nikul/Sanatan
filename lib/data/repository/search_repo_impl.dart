import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/either.dart';
import '../errors/failure.dart';
import '../models/response_model/auth/user_data_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<UserDataModel>>> searchUsers(final String query) async {
    try {
      if (query.isEmpty) {
        return const Right(<UserDataModel>[]);
      }

      final String lowercaseQuery = query.toLowerCase().trim();
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isGreaterThanOrEqualTo: lowercaseQuery)
          .where('username', isLessThanOrEqualTo: '$lowercaseQuery\uf8ff')
          .get();

      final String? currentUid = FirebaseAuth.instance.currentUser?.uid;
      final List<UserDataModel> usersList = <UserDataModel>[];
      for (final DocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        final Map<String, dynamic> data = doc.data() ?? <String, dynamic>{};
        final String uid = data['uid'] ?? doc.id;
        
        if (currentUid != null && uid == currentUid) {
          continue;
        }

        usersList.add(
          UserDataModel(
            userRegistrationId: data['user_registration_id'] ?? 1,
            fullName: data['full_name'] ?? data['name'] ?? 'Viramgami Nikul',
            emailId: data['email_id'] ?? '',
            mobileNumber: data['mobile_number'] ?? '',
            profileImage: data['profile_image'] ?? data['photoUrl'] ?? '',
            authToken: '',
            uid: uid,
            username: data['username'] ?? '',
            bio: data['bio'] ?? '',
            photoUrl: data['photoUrl'] ?? data['profile_image'] ?? '',
            followersCount: data['followersCount'] ?? 0,
            followingCount: data['followingCount'] ?? 0,
            postsCount: data['postsCount'] ?? 0,
            isVerified: data['isVerified'] ?? false,
          ),
        );
      }
      return Right(usersList);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
