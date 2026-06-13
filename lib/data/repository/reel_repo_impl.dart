import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/reel/reel_model.dart';
import 'reel_repo.dart';

class ReelRepoImpl implements ReelRepo {
  @override
  Future<Either<Failure, ReelModel>> createReel({
    required final String localVideoPath,
    required final String caption,
    final String? category,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String uid = currentUser.uid;

      // 1. Upload picked video to Firebase Storage under reels/ folder
      final File file = File(localVideoPath);
      final String fileName = 'reels/${uid}_${DateTime.now().millisecondsSinceEpoch}.mp4';
      final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      
      final UploadTask uploadTask = storageRef.putFile(file);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      // 2. Generate a reel document ID in Firestore
      final DocumentReference reelDoc = FirebaseFirestore.instance.collection('reels').doc();
      final String reelId = reelDoc.id;

      final ReelModel reel = ReelModel(
        reelId: reelId,
        uid: uid,
        videoUrl: downloadUrl,
        caption: caption,
        likesCount: 0,
        commentsCount: 0,
        createdAt: FieldValue.serverTimestamp(),
        category: category,
      );

      // 3. Save reel document to Firestore
      await reelDoc.set(reel.toJson());

      return Right(reel);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReelModel>>> getReels() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('reels')
          .get();

      final List<ReelModel> reels = querySnapshot.docs.map((final QueryDocumentSnapshot doc) {
        return ReelModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Sort reels in memory by createdAt descending
      reels.sort((final a, final b) {
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

      return Right(reels);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReel({required final String reelId}) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String uid = currentUser.uid;

      final DocumentReference reelDoc = FirebaseFirestore.instance.collection('reels').doc(reelId);
      final DocumentSnapshot reelSnapshot = await reelDoc.get();

      if (!reelSnapshot.exists) {
        return const Left(ApiFailure(message: 'Reel not found'));
      }

      final String reelUid = reelSnapshot.get('uid') as String? ?? '';
      if (reelUid != uid) {
        return const Left(ApiFailure(message: 'You are not authorized to delete this reel'));
      }

      await reelDoc.delete();
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
