// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkingEvent()';
}


}

/// @nodoc
class $WorkingEventCopyWith<$Res>  {
$WorkingEventCopyWith(WorkingEvent _, $Res Function(WorkingEvent) __);
}


/// Adds pattern-matching-related methods to [WorkingEvent].
extension WorkingEventPatterns on WorkingEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _FetchJobs value)?  fetchJobs,TResult Function( _LoadMore value)?  loadMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FetchJobs() when fetchJobs != null:
return fetchJobs(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _FetchJobs value)  fetchJobs,required TResult Function( _LoadMore value)  loadMore,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _FetchJobs():
return fetchJobs(_that);case _LoadMore():
return loadMore(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _FetchJobs value)?  fetchJobs,TResult? Function( _LoadMore value)?  loadMore,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FetchJobs() when fetchJobs != null:
return fetchJobs(_that);case _LoadMore() when loadMore != null:
return loadMore(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int page,  int? minimalGaji,  int? maksimalGaji,  String? search,  String? jenis,  List<int>? tipe)?  fetchJobs,TResult Function( int? minimalGaji,  int? maksimalGaji,  String? jenis)?  loadMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FetchJobs() when fetchJobs != null:
return fetchJobs(_that.page,_that.minimalGaji,_that.maksimalGaji,_that.search,_that.jenis,_that.tipe);case _LoadMore() when loadMore != null:
return loadMore(_that.minimalGaji,_that.maksimalGaji,_that.jenis);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int page,  int? minimalGaji,  int? maksimalGaji,  String? search,  String? jenis,  List<int>? tipe)  fetchJobs,required TResult Function( int? minimalGaji,  int? maksimalGaji,  String? jenis)  loadMore,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _FetchJobs():
return fetchJobs(_that.page,_that.minimalGaji,_that.maksimalGaji,_that.search,_that.jenis,_that.tipe);case _LoadMore():
return loadMore(_that.minimalGaji,_that.maksimalGaji,_that.jenis);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int page,  int? minimalGaji,  int? maksimalGaji,  String? search,  String? jenis,  List<int>? tipe)?  fetchJobs,TResult? Function( int? minimalGaji,  int? maksimalGaji,  String? jenis)?  loadMore,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FetchJobs() when fetchJobs != null:
return fetchJobs(_that.page,_that.minimalGaji,_that.maksimalGaji,_that.search,_that.jenis,_that.tipe);case _LoadMore() when loadMore != null:
return loadMore(_that.minimalGaji,_that.maksimalGaji,_that.jenis);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements WorkingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkingEvent.started()';
}


}




/// @nodoc


class _FetchJobs implements WorkingEvent {
  const _FetchJobs({required this.page, this.minimalGaji, this.maksimalGaji, this.search, this.jenis, final  List<int>? tipe}): _tipe = tipe;
  

 final  int page;
 final  int? minimalGaji;
 final  int? maksimalGaji;
 final  String? search;
 final  String? jenis;
 final  List<int>? _tipe;
 List<int>? get tipe {
  final value = _tipe;
  if (value == null) return null;
  if (_tipe is EqualUnmodifiableListView) return _tipe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WorkingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchJobsCopyWith<_FetchJobs> get copyWith => __$FetchJobsCopyWithImpl<_FetchJobs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchJobs&&(identical(other.page, page) || other.page == page)&&(identical(other.minimalGaji, minimalGaji) || other.minimalGaji == minimalGaji)&&(identical(other.maksimalGaji, maksimalGaji) || other.maksimalGaji == maksimalGaji)&&(identical(other.search, search) || other.search == search)&&(identical(other.jenis, jenis) || other.jenis == jenis)&&const DeepCollectionEquality().equals(other._tipe, _tipe));
}


@override
int get hashCode => Object.hash(runtimeType,page,minimalGaji,maksimalGaji,search,jenis,const DeepCollectionEquality().hash(_tipe));

@override
String toString() {
  return 'WorkingEvent.fetchJobs(page: $page, minimalGaji: $minimalGaji, maksimalGaji: $maksimalGaji, search: $search, jenis: $jenis, tipe: $tipe)';
}


}

/// @nodoc
abstract mixin class _$FetchJobsCopyWith<$Res> implements $WorkingEventCopyWith<$Res> {
  factory _$FetchJobsCopyWith(_FetchJobs value, $Res Function(_FetchJobs) _then) = __$FetchJobsCopyWithImpl;
@useResult
$Res call({
 int page, int? minimalGaji, int? maksimalGaji, String? search, String? jenis, List<int>? tipe
});




}
/// @nodoc
class __$FetchJobsCopyWithImpl<$Res>
    implements _$FetchJobsCopyWith<$Res> {
  __$FetchJobsCopyWithImpl(this._self, this._then);

  final _FetchJobs _self;
  final $Res Function(_FetchJobs) _then;

/// Create a copy of WorkingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? minimalGaji = freezed,Object? maksimalGaji = freezed,Object? search = freezed,Object? jenis = freezed,Object? tipe = freezed,}) {
  return _then(_FetchJobs(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,minimalGaji: freezed == minimalGaji ? _self.minimalGaji : minimalGaji // ignore: cast_nullable_to_non_nullable
as int?,maksimalGaji: freezed == maksimalGaji ? _self.maksimalGaji : maksimalGaji // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,jenis: freezed == jenis ? _self.jenis : jenis // ignore: cast_nullable_to_non_nullable
as String?,tipe: freezed == tipe ? _self._tipe : tipe // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

/// @nodoc


class _LoadMore implements WorkingEvent {
  const _LoadMore({this.minimalGaji, this.maksimalGaji, this.jenis});
  

 final  int? minimalGaji;
 final  int? maksimalGaji;
 final  String? jenis;

/// Create a copy of WorkingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadMoreCopyWith<_LoadMore> get copyWith => __$LoadMoreCopyWithImpl<_LoadMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMore&&(identical(other.minimalGaji, minimalGaji) || other.minimalGaji == minimalGaji)&&(identical(other.maksimalGaji, maksimalGaji) || other.maksimalGaji == maksimalGaji)&&(identical(other.jenis, jenis) || other.jenis == jenis));
}


@override
int get hashCode => Object.hash(runtimeType,minimalGaji,maksimalGaji,jenis);

@override
String toString() {
  return 'WorkingEvent.loadMore(minimalGaji: $minimalGaji, maksimalGaji: $maksimalGaji, jenis: $jenis)';
}


}

/// @nodoc
abstract mixin class _$LoadMoreCopyWith<$Res> implements $WorkingEventCopyWith<$Res> {
  factory _$LoadMoreCopyWith(_LoadMore value, $Res Function(_LoadMore) _then) = __$LoadMoreCopyWithImpl;
@useResult
$Res call({
 int? minimalGaji, int? maksimalGaji, String? jenis
});




}
/// @nodoc
class __$LoadMoreCopyWithImpl<$Res>
    implements _$LoadMoreCopyWith<$Res> {
  __$LoadMoreCopyWithImpl(this._self, this._then);

  final _LoadMore _self;
  final $Res Function(_LoadMore) _then;

/// Create a copy of WorkingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minimalGaji = freezed,Object? maksimalGaji = freezed,Object? jenis = freezed,}) {
  return _then(_LoadMore(
minimalGaji: freezed == minimalGaji ? _self.minimalGaji : minimalGaji // ignore: cast_nullable_to_non_nullable
as int?,maksimalGaji: freezed == maksimalGaji ? _self.maksimalGaji : maksimalGaji // ignore: cast_nullable_to_non_nullable
as int?,jenis: freezed == jenis ? _self.jenis : jenis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$WorkingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkingState()';
}


}

/// @nodoc
class $WorkingStateCopyWith<$Res>  {
$WorkingStateCopyWith(WorkingState _, $Res Function(WorkingState) __);
}


/// Adds pattern-matching-related methods to [WorkingState].
extension WorkingStatePatterns on WorkingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Datum> jobs,  bool hasReachedMax,  int currentPage,  int lastPage,  int perPage,  int total)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.jobs,_that.hasReachedMax,_that.currentPage,_that.lastPage,_that.perPage,_that.total);case _Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Datum> jobs,  bool hasReachedMax,  int currentPage,  int lastPage,  int perPage,  int total)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.jobs,_that.hasReachedMax,_that.currentPage,_that.lastPage,_that.perPage,_that.total);case _Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Datum> jobs,  bool hasReachedMax,  int currentPage,  int lastPage,  int perPage,  int total)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.jobs,_that.hasReachedMax,_that.currentPage,_that.lastPage,_that.perPage,_that.total);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WorkingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkingState.initial()';
}


}




/// @nodoc


class _Loading implements WorkingState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkingState.loading()';
}


}




/// @nodoc


class _Loaded implements WorkingState {
  const _Loaded({required final  List<Datum> jobs, required this.hasReachedMax, this.currentPage = 1, this.lastPage = 1, this.perPage = 0, this.total = 0}): _jobs = jobs;
  

 final  List<Datum> _jobs;
 List<Datum> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

 final  bool hasReachedMax;
@JsonKey() final  int currentPage;
@JsonKey() final  int lastPage;
@JsonKey() final  int perPage;
@JsonKey() final  int total;

/// Create a copy of WorkingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jobs),hasReachedMax,currentPage,lastPage,perPage,total);

@override
String toString() {
  return 'WorkingState.loaded(jobs: $jobs, hasReachedMax: $hasReachedMax, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $WorkingStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Datum> jobs, bool hasReachedMax, int currentPage, int lastPage, int perPage, int total
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of WorkingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jobs = null,Object? hasReachedMax = null,Object? currentPage = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_Loaded(
jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<Datum>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Error implements WorkingState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of WorkingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WorkingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $WorkingStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of WorkingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
