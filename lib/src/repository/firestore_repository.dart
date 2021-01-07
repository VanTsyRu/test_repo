import 'package:pilgrim/src/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final _postInstance = FirebaseFirestore.instance.collection('/posts');

  Stream<List<Post>> fetchPosts() async* {
    yield* _postInstance.snapshots().map(
          (event) => event.docs
              .map(
                (e) => Post.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }
}
