// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'firestore_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FirestorePostEventTearOff {
  const _$FirestorePostEventTearOff();

// ignore: unused_element
  ReadFirestorePostEvent read() {
    return const ReadFirestorePostEvent();
  }

// ignore: unused_element
  UpdateFirestorePostEvent update(List<Post> posts) {
    return UpdateFirestorePostEvent(
      posts,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FirestorePostEvent = _$FirestorePostEventTearOff();

/// @nodoc
mixin _$FirestorePostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult read(),
    @required TResult update(List<Post> posts),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult read(),
    TResult update(List<Post> posts),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult read(ReadFirestorePostEvent value),
    @required TResult update(UpdateFirestorePostEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult read(ReadFirestorePostEvent value),
    TResult update(UpdateFirestorePostEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FirestorePostEventCopyWith<$Res> {
  factory $FirestorePostEventCopyWith(
          FirestorePostEvent value, $Res Function(FirestorePostEvent) then) =
      _$FirestorePostEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirestorePostEventCopyWithImpl<$Res>
    implements $FirestorePostEventCopyWith<$Res> {
  _$FirestorePostEventCopyWithImpl(this._value, this._then);

  final FirestorePostEvent _value;
  // ignore: unused_field
  final $Res Function(FirestorePostEvent) _then;
}

/// @nodoc
abstract class $ReadFirestorePostEventCopyWith<$Res> {
  factory $ReadFirestorePostEventCopyWith(ReadFirestorePostEvent value,
          $Res Function(ReadFirestorePostEvent) then) =
      _$ReadFirestorePostEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReadFirestorePostEventCopyWithImpl<$Res>
    extends _$FirestorePostEventCopyWithImpl<$Res>
    implements $ReadFirestorePostEventCopyWith<$Res> {
  _$ReadFirestorePostEventCopyWithImpl(ReadFirestorePostEvent _value,
      $Res Function(ReadFirestorePostEvent) _then)
      : super(_value, (v) => _then(v as ReadFirestorePostEvent));

  @override
  ReadFirestorePostEvent get _value => super._value as ReadFirestorePostEvent;
}

/// @nodoc
class _$ReadFirestorePostEvent extends ReadFirestorePostEvent {
  const _$ReadFirestorePostEvent() : super._();

  @override
  String toString() {
    return 'FirestorePostEvent.read()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReadFirestorePostEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult read(),
    @required TResult update(List<Post> posts),
  }) {
    assert(read != null);
    assert(update != null);
    return read();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult read(),
    TResult update(List<Post> posts),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (read != null) {
      return read();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult read(ReadFirestorePostEvent value),
    @required TResult update(UpdateFirestorePostEvent value),
  }) {
    assert(read != null);
    assert(update != null);
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult read(ReadFirestorePostEvent value),
    TResult update(UpdateFirestorePostEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class ReadFirestorePostEvent extends FirestorePostEvent {
  const ReadFirestorePostEvent._() : super._();
  const factory ReadFirestorePostEvent() = _$ReadFirestorePostEvent;
}

/// @nodoc
abstract class $UpdateFirestorePostEventCopyWith<$Res> {
  factory $UpdateFirestorePostEventCopyWith(UpdateFirestorePostEvent value,
          $Res Function(UpdateFirestorePostEvent) then) =
      _$UpdateFirestorePostEventCopyWithImpl<$Res>;
  $Res call({List<Post> posts});
}

/// @nodoc
class _$UpdateFirestorePostEventCopyWithImpl<$Res>
    extends _$FirestorePostEventCopyWithImpl<$Res>
    implements $UpdateFirestorePostEventCopyWith<$Res> {
  _$UpdateFirestorePostEventCopyWithImpl(UpdateFirestorePostEvent _value,
      $Res Function(UpdateFirestorePostEvent) _then)
      : super(_value, (v) => _then(v as UpdateFirestorePostEvent));

  @override
  UpdateFirestorePostEvent get _value =>
      super._value as UpdateFirestorePostEvent;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(UpdateFirestorePostEvent(
      posts == freezed ? _value.posts : posts as List<Post>,
    ));
  }
}

/// @nodoc
class _$UpdateFirestorePostEvent extends UpdateFirestorePostEvent {
  const _$UpdateFirestorePostEvent(this.posts)
      : assert(posts != null),
        super._();

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'FirestorePostEvent.update(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateFirestorePostEvent &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @override
  $UpdateFirestorePostEventCopyWith<UpdateFirestorePostEvent> get copyWith =>
      _$UpdateFirestorePostEventCopyWithImpl<UpdateFirestorePostEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult read(),
    @required TResult update(List<Post> posts),
  }) {
    assert(read != null);
    assert(update != null);
    return update(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult read(),
    TResult update(List<Post> posts),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult read(ReadFirestorePostEvent value),
    @required TResult update(UpdateFirestorePostEvent value),
  }) {
    assert(read != null);
    assert(update != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult read(ReadFirestorePostEvent value),
    TResult update(UpdateFirestorePostEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class UpdateFirestorePostEvent extends FirestorePostEvent {
  const UpdateFirestorePostEvent._() : super._();
  const factory UpdateFirestorePostEvent(List<Post> posts) =
      _$UpdateFirestorePostEvent;

  List<Post> get posts;
  $UpdateFirestorePostEventCopyWith<UpdateFirestorePostEvent> get copyWith;
}

/// @nodoc
class _$FirestorePostStateTearOff {
  const _$FirestorePostStateTearOff();

// ignore: unused_element
  InitialFirestorePostState initial() {
    return const InitialFirestorePostState();
  }

// ignore: unused_element
  FirestorePostStateLoaded loaded(List<Post> posts) {
    return FirestorePostStateLoaded(
      posts,
    );
  }

// ignore: unused_element
  FirestorePostStateError error(Exception exception, StackTrace st) {
    return FirestorePostStateError(
      exception,
      st,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FirestorePostState = _$FirestorePostStateTearOff();

/// @nodoc
mixin _$FirestorePostState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Post> posts),
    @required TResult error(Exception exception, StackTrace st),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<Post> posts),
    TResult error(Exception exception, StackTrace st),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(InitialFirestorePostState value),
    @required TResult loaded(FirestorePostStateLoaded value),
    @required TResult error(FirestorePostStateError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(InitialFirestorePostState value),
    TResult loaded(FirestorePostStateLoaded value),
    TResult error(FirestorePostStateError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FirestorePostStateCopyWith<$Res> {
  factory $FirestorePostStateCopyWith(
          FirestorePostState value, $Res Function(FirestorePostState) then) =
      _$FirestorePostStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirestorePostStateCopyWithImpl<$Res>
    implements $FirestorePostStateCopyWith<$Res> {
  _$FirestorePostStateCopyWithImpl(this._value, this._then);

  final FirestorePostState _value;
  // ignore: unused_field
  final $Res Function(FirestorePostState) _then;
}

/// @nodoc
abstract class $InitialFirestorePostStateCopyWith<$Res> {
  factory $InitialFirestorePostStateCopyWith(InitialFirestorePostState value,
          $Res Function(InitialFirestorePostState) then) =
      _$InitialFirestorePostStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialFirestorePostStateCopyWithImpl<$Res>
    extends _$FirestorePostStateCopyWithImpl<$Res>
    implements $InitialFirestorePostStateCopyWith<$Res> {
  _$InitialFirestorePostStateCopyWithImpl(InitialFirestorePostState _value,
      $Res Function(InitialFirestorePostState) _then)
      : super(_value, (v) => _then(v as InitialFirestorePostState));

  @override
  InitialFirestorePostState get _value =>
      super._value as InitialFirestorePostState;
}

/// @nodoc
class _$InitialFirestorePostState extends InitialFirestorePostState {
  const _$InitialFirestorePostState() : super._();

  @override
  String toString() {
    return 'FirestorePostState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialFirestorePostState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Post> posts),
    @required TResult error(Exception exception, StackTrace st),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<Post> posts),
    TResult error(Exception exception, StackTrace st),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(InitialFirestorePostState value),
    @required TResult loaded(FirestorePostStateLoaded value),
    @required TResult error(FirestorePostStateError value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(InitialFirestorePostState value),
    TResult loaded(FirestorePostStateLoaded value),
    TResult error(FirestorePostStateError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialFirestorePostState extends FirestorePostState {
  const InitialFirestorePostState._() : super._();
  const factory InitialFirestorePostState() = _$InitialFirestorePostState;
}

/// @nodoc
abstract class $FirestorePostStateLoadedCopyWith<$Res> {
  factory $FirestorePostStateLoadedCopyWith(FirestorePostStateLoaded value,
          $Res Function(FirestorePostStateLoaded) then) =
      _$FirestorePostStateLoadedCopyWithImpl<$Res>;
  $Res call({List<Post> posts});
}

/// @nodoc
class _$FirestorePostStateLoadedCopyWithImpl<$Res>
    extends _$FirestorePostStateCopyWithImpl<$Res>
    implements $FirestorePostStateLoadedCopyWith<$Res> {
  _$FirestorePostStateLoadedCopyWithImpl(FirestorePostStateLoaded _value,
      $Res Function(FirestorePostStateLoaded) _then)
      : super(_value, (v) => _then(v as FirestorePostStateLoaded));

  @override
  FirestorePostStateLoaded get _value =>
      super._value as FirestorePostStateLoaded;

  @override
  $Res call({
    Object posts = freezed,
  }) {
    return _then(FirestorePostStateLoaded(
      posts == freezed ? _value.posts : posts as List<Post>,
    ));
  }
}

/// @nodoc
class _$FirestorePostStateLoaded extends FirestorePostStateLoaded {
  const _$FirestorePostStateLoaded(this.posts)
      : assert(posts != null),
        super._();

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'FirestorePostState.loaded(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FirestorePostStateLoaded &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @override
  $FirestorePostStateLoadedCopyWith<FirestorePostStateLoaded> get copyWith =>
      _$FirestorePostStateLoadedCopyWithImpl<FirestorePostStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Post> posts),
    @required TResult error(Exception exception, StackTrace st),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<Post> posts),
    TResult error(Exception exception, StackTrace st),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(InitialFirestorePostState value),
    @required TResult loaded(FirestorePostStateLoaded value),
    @required TResult error(FirestorePostStateError value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(InitialFirestorePostState value),
    TResult loaded(FirestorePostStateLoaded value),
    TResult error(FirestorePostStateError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FirestorePostStateLoaded extends FirestorePostState {
  const FirestorePostStateLoaded._() : super._();
  const factory FirestorePostStateLoaded(List<Post> posts) =
      _$FirestorePostStateLoaded;

  List<Post> get posts;
  $FirestorePostStateLoadedCopyWith<FirestorePostStateLoaded> get copyWith;
}

/// @nodoc
abstract class $FirestorePostStateErrorCopyWith<$Res> {
  factory $FirestorePostStateErrorCopyWith(FirestorePostStateError value,
          $Res Function(FirestorePostStateError) then) =
      _$FirestorePostStateErrorCopyWithImpl<$Res>;
  $Res call({Exception exception, StackTrace st});
}

/// @nodoc
class _$FirestorePostStateErrorCopyWithImpl<$Res>
    extends _$FirestorePostStateCopyWithImpl<$Res>
    implements $FirestorePostStateErrorCopyWith<$Res> {
  _$FirestorePostStateErrorCopyWithImpl(FirestorePostStateError _value,
      $Res Function(FirestorePostStateError) _then)
      : super(_value, (v) => _then(v as FirestorePostStateError));

  @override
  FirestorePostStateError get _value => super._value as FirestorePostStateError;

  @override
  $Res call({
    Object exception = freezed,
    Object st = freezed,
  }) {
    return _then(FirestorePostStateError(
      exception == freezed ? _value.exception : exception as Exception,
      st == freezed ? _value.st : st as StackTrace,
    ));
  }
}

/// @nodoc
class _$FirestorePostStateError extends FirestorePostStateError {
  const _$FirestorePostStateError(this.exception, this.st)
      : assert(exception != null),
        assert(st != null),
        super._();

  @override
  final Exception exception;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'FirestorePostState.error(exception: $exception, st: $st)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FirestorePostStateError &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)) &&
            (identical(other.st, st) ||
                const DeepCollectionEquality().equals(other.st, st)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(exception) ^
      const DeepCollectionEquality().hash(st);

  @override
  $FirestorePostStateErrorCopyWith<FirestorePostStateError> get copyWith =>
      _$FirestorePostStateErrorCopyWithImpl<FirestorePostStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loaded(List<Post> posts),
    @required TResult error(Exception exception, StackTrace st),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(error != null);
    return error(exception, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loaded(List<Post> posts),
    TResult error(Exception exception, StackTrace st),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(exception, st);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(InitialFirestorePostState value),
    @required TResult loaded(FirestorePostStateLoaded value),
    @required TResult error(FirestorePostStateError value),
  }) {
    assert(initial != null);
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(InitialFirestorePostState value),
    TResult loaded(FirestorePostStateLoaded value),
    TResult error(FirestorePostStateError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FirestorePostStateError extends FirestorePostState {
  const FirestorePostStateError._() : super._();
  const factory FirestorePostStateError(Exception exception, StackTrace st) =
      _$FirestorePostStateError;

  Exception get exception;
  StackTrace get st;
  $FirestorePostStateErrorCopyWith<FirestorePostStateError> get copyWith;
}
