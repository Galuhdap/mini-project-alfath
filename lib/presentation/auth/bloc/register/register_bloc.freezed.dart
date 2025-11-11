// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RegisterRequested value)?  registerRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RegisterRequested() when registerRequested != null:
return registerRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RegisterRequested value)  registerRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RegisterRequested():
return registerRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RegisterRequested value)?  registerRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RegisterRequested() when registerRequested != null:
return registerRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( RegisterAuthRequest request)?  registerRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RegisterRequested() when registerRequested != null:
return registerRequested(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( RegisterAuthRequest request)  registerRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RegisterRequested():
return registerRequested(_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( RegisterAuthRequest request)?  registerRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RegisterRequested() when registerRequested != null:
return registerRequested(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RegisterEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.started()';
}


}




/// @nodoc


class _RegisterRequested implements RegisterEvent {
  const _RegisterRequested(this.request);
  

 final  RegisterAuthRequest request;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterRequestedCopyWith<_RegisterRequested> get copyWith => __$RegisterRequestedCopyWithImpl<_RegisterRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterRequested&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'RegisterEvent.registerRequested(request: $request)';
}


}

/// @nodoc
abstract mixin class _$RegisterRequestedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$RegisterRequestedCopyWith(_RegisterRequested value, $Res Function(_RegisterRequested) _then) = __$RegisterRequestedCopyWithImpl;
@useResult
$Res call({
 RegisterAuthRequest request
});




}
/// @nodoc
class __$RegisterRequestedCopyWithImpl<$Res>
    implements _$RegisterRequestedCopyWith<$Res> {
  __$RegisterRequestedCopyWithImpl(this._self, this._then);

  final _RegisterRequested _self;
  final $Res Function(_RegisterRequested) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_RegisterRequested(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RegisterAuthRequest,
  ));
}


}

/// @nodoc
mixin _$RegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState()';
}


}

/// @nodoc
class $RegisterStateCopyWith<$Res>  {
$RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _RegisterLoading value)?  loading,TResult Function( _RegisterSuccess value)?  success,TResult Function( _RegisterFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RegisterLoading() when loading != null:
return loading(_that);case _RegisterSuccess() when success != null:
return success(_that);case _RegisterFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _RegisterLoading value)  loading,required TResult Function( _RegisterSuccess value)  success,required TResult Function( _RegisterFailed value)  failed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _RegisterLoading():
return loading(_that);case _RegisterSuccess():
return success(_that);case _RegisterFailed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _RegisterLoading value)?  loading,TResult? Function( _RegisterSuccess value)?  success,TResult? Function( _RegisterFailed value)?  failed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RegisterLoading() when loading != null:
return loading(_that);case _RegisterSuccess() when success != null:
return success(_that);case _RegisterFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( GetRegisterAuthResponse authResponse)?  success,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RegisterLoading() when loading != null:
return loading();case _RegisterSuccess() when success != null:
return success(_that.authResponse);case _RegisterFailed() when failed != null:
return failed(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( GetRegisterAuthResponse authResponse)  success,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _RegisterLoading():
return loading();case _RegisterSuccess():
return success(_that.authResponse);case _RegisterFailed():
return failed(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( GetRegisterAuthResponse authResponse)?  success,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RegisterLoading() when loading != null:
return loading();case _RegisterSuccess() when success != null:
return success(_that.authResponse);case _RegisterFailed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RegisterState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.initial()';
}


}




/// @nodoc


class _RegisterLoading implements RegisterState {
  const _RegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.loading()';
}


}




/// @nodoc


class _RegisterSuccess implements RegisterState {
  const _RegisterSuccess(this.authResponse);
  

 final  GetRegisterAuthResponse authResponse;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterSuccessCopyWith<_RegisterSuccess> get copyWith => __$RegisterSuccessCopyWithImpl<_RegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterSuccess&&(identical(other.authResponse, authResponse) || other.authResponse == authResponse));
}


@override
int get hashCode => Object.hash(runtimeType,authResponse);

@override
String toString() {
  return 'RegisterState.success(authResponse: $authResponse)';
}


}

/// @nodoc
abstract mixin class _$RegisterSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterSuccessCopyWith(_RegisterSuccess value, $Res Function(_RegisterSuccess) _then) = __$RegisterSuccessCopyWithImpl;
@useResult
$Res call({
 GetRegisterAuthResponse authResponse
});




}
/// @nodoc
class __$RegisterSuccessCopyWithImpl<$Res>
    implements _$RegisterSuccessCopyWith<$Res> {
  __$RegisterSuccessCopyWithImpl(this._self, this._then);

  final _RegisterSuccess _self;
  final $Res Function(_RegisterSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authResponse = null,}) {
  return _then(_RegisterSuccess(
null == authResponse ? _self.authResponse : authResponse // ignore: cast_nullable_to_non_nullable
as GetRegisterAuthResponse,
  ));
}


}

/// @nodoc


class _RegisterFailed implements RegisterState {
  const _RegisterFailed(this.message);
  

 final  String message;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFailedCopyWith<_RegisterFailed> get copyWith => __$RegisterFailedCopyWithImpl<_RegisterFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RegisterState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RegisterFailedCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterFailedCopyWith(_RegisterFailed value, $Res Function(_RegisterFailed) _then) = __$RegisterFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RegisterFailedCopyWithImpl<$Res>
    implements _$RegisterFailedCopyWith<$Res> {
  __$RegisterFailedCopyWithImpl(this._self, this._then);

  final _RegisterFailed _self;
  final $Res Function(_RegisterFailed) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RegisterFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
