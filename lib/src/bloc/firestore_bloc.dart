import 'dart:async';

import 'package:pilgrim/src/models/post.dart';
import 'package:pilgrim/src/repository/firestore_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firestore_bloc.freezed.dart';

@freezed
abstract class FirestorePostEvent with _$FirestorePostEvent {
  const FirestorePostEvent._();

  const factory FirestorePostEvent.read() = ReadFirestorePostEvent;
  const factory FirestorePostEvent.update(List<Post> posts) =
      UpdateFirestorePostEvent;
}

@freezed
abstract class FirestorePostState with _$FirestorePostState {
  const FirestorePostState._();

  const factory FirestorePostState.initial() = InitialFirestorePostState;

  const factory FirestorePostState.loaded(List<Post> posts) =
      FirestorePostStateLoaded;

  const factory FirestorePostState.error(Exception exception, StackTrace st) = FirestorePostStateError;
}

class FirestorePostBLoC extends Bloc<FirestorePostEvent, FirestorePostState> {
  FirestorePostBLoC(FirestoreRepository repository)
      : _repository = repository ?? FirestoreRepository(),
        super(const InitialFirestorePostState());

  final FirestoreRepository _repository;

  StreamSubscription _postsSubscription;

  @override
  Future<void> close() {
    _postsSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<FirestorePostState> mapEventToState(FirestorePostEvent event) =>
      event.when<Stream<FirestorePostState>>(
        read: _read,
        update: (_) => _update(_),
      );

  Stream<FirestorePostState> _read() async* {
    try {
      _postsSubscription = _repository.fetchPosts().listen((event) {
        add(UpdateFirestorePostEvent(event));
      });
    } on Exception catch(e, st){
      yield FirestorePostStateError(e, st);
    }
  }

  Stream<FirestorePostState> _update(List<Post> posts) async* {
    yield FirestorePostStateLoaded(posts);
  }
}
