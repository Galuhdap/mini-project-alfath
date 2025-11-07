// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LoginRequested value)?  loginRequested,TResult Function( _AutoLoginRequested value)?  autoLoginRequested,TResult Function( LogoutRequested value)?  logoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoginRequested() when loginRequested != null:
return loginRequested(_that);case _AutoLoginRequested() when autoLoginRequested != null:
return autoLoginRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LoginRequested value)  loginRequested,required TResult Function( _AutoLoginRequested value)  autoLoginRequested,required TResult Function( LogoutRequested value)  logoutRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LoginRequested():
return loginRequested(_that);case _AutoLoginRequested():
return autoLoginRequested(_that);case LogoutRequested():
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LoginRequested value)?  loginRequested,TResult? Function( _AutoLoginRequested value)?  autoLoginRequested,TResult? Function( LogoutRequested value)?  logoutRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoginRequested() when loginRequested != null:
return loginRequested(_that);case _AutoLoginRequested() when autoLoginRequested != null:
return autoLoginRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String email,  String password)?  loginRequested,TResult Function()?  autoLoginRequested,TResult Function()?  logoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case _AutoLoginRequested() when autoLoginRequested != null:
return autoLoginRequested();case LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String email,  String password)  loginRequested,required TResult Function()  autoLoginRequested,required TResult Function()  logoutRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _LoginRequested():
return loginRequested(_that.email,_that.password);case _AutoLoginRequested():
return autoLoginRequested();case LogoutRequested():
return logoutRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String email,  String password)?  loginRequested,TResult? Function()?  autoLoginRequested,TResult? Function()?  logoutRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case _AutoLoginRequested() when autoLoginRequested != null:
return autoLoginRequested();case LogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LoginEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.started()';
}


}




/// @nodoc


class _LoginRequested implements LoginEvent {
  const _LoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestedCopyWith<_LoginRequested> get copyWith => __$LoginRequestedCopyWithImpl<_LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$LoginRequestedCopyWith(_LoginRequested value, $Res Function(_LoginRequested) _then) = __$LoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginRequestedCopyWithImpl<$Res>
    implements _$LoginRequestedCopyWith<$Res> {
  __$LoginRequestedCopyWithImpl(this._self, this._then);

  final _LoginRequested _self;
  final $Res Function(_LoginRequested) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AutoLoginRequested implements LoginEvent {
  const _AutoLoginRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AutoLoginRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.autoLoginRequested()';
}


}




/// @nodoc


class LogoutRequested implements LoginEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.logoutRequested()';
}


}




/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoginLoading value)?  loading,TResult Function( _LoginSuccess value)?  success,TResult Function( _LoginFailed value)?  failed,TResult Function( _LoginAuthenticated value)?  authenticated,TResult Function( _LoginUnauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoginLoading() when loading != null:
return loading(_that);case _LoginSuccess() when success != null:
return success(_that);case _LoginFailed() when failed != null:
return failed(_that);case _LoginAuthenticated() when authenticated != null:
return authenticated(_that);case _LoginUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoginLoading value)  loading,required TResult Function( _LoginSuccess value)  success,required TResult Function( _LoginFailed value)  failed,required TResult Function( _LoginAuthenticated value)  authenticated,required TResult Function( _LoginUnauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoginLoading():
return loading(_that);case _LoginSuccess():
return success(_that);case _LoginFailed():
return failed(_that);case _LoginAuthenticated():
return authenticated(_that);case _LoginUnauthenticated():
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoginLoading value)?  loading,TResult? Function( _LoginSuccess value)?  success,TResult? Function( _LoginFailed value)?  failed,TResult? Function( _LoginAuthenticated value)?  authenticated,TResult? Function( _LoginUnauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoginLoading() when loading != null:
return loading(_that);case _LoginSuccess() when success != null:
return success(_that);case _LoginFailed() when failed != null:
return failed(_that);case _LoginAuthenticated() when authenticated != null:
return authenticated(_that);case _LoginUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( GetLoginAuthResponse authResponse)?  success,TResult Function( String message)?  failed,TResult Function( GetLoginAuthResponse authResponse)?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoginLoading() when loading != null:
return loading();case _LoginSuccess() when success != null:
return success(_that.authResponse);case _LoginFailed() when failed != null:
return failed(_that.message);case _LoginAuthenticated() when authenticated != null:
return authenticated(_that.authResponse);case _LoginUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( GetLoginAuthResponse authResponse)  success,required TResult Function( String message)  failed,required TResult Function( GetLoginAuthResponse authResponse)  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoginLoading():
return loading();case _LoginSuccess():
return success(_that.authResponse);case _LoginFailed():
return failed(_that.message);case _LoginAuthenticated():
return authenticated(_that.authResponse);case _LoginUnauthenticated():
return unauthenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( GetLoginAuthResponse authResponse)?  success,TResult? Function( String message)?  failed,TResult? Function( GetLoginAuthResponse authResponse)?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoginLoading() when loading != null:
return loading();case _LoginSuccess() when success != null:
return success(_that.authResponse);case _LoginFailed() when failed != null:
return failed(_that.message);case _LoginAuthenticated() when authenticated != null:
return authenticated(_that.authResponse);case _LoginUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class _LoginLoading implements LoginState {
  const _LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class _LoginSuccess implements LoginState {
  const _LoginSuccess(this.authResponse);
  

 final  GetLoginAuthResponse authResponse;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginSuccessCopyWith<_LoginSuccess> get copyWith => __$LoginSuccessCopyWithImpl<_LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSuccess&&(identical(other.authResponse, authResponse) || other.authResponse == authResponse));
}


@override
int get hashCode => Object.hash(runtimeType,authResponse);

@override
String toString() {
  return 'LoginState.success(authResponse: $authResponse)';
}


}

/// @nodoc
abstract mixin class _$LoginSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginSuccessCopyWith(_LoginSuccess value, $Res Function(_LoginSuccess) _then) = __$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 GetLoginAuthResponse authResponse
});




}
/// @nodoc
class __$LoginSuccessCopyWithImpl<$Res>
    implements _$LoginSuccessCopyWith<$Res> {
  __$LoginSuccessCopyWithImpl(this._self, this._then);

  final _LoginSuccess _self;
  final $Res Function(_LoginSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authResponse = null,}) {
  return _then(_LoginSuccess(
null == authResponse ? _self.authResponse : authResponse // ignore: cast_nullable_to_non_nullable
as GetLoginAuthResponse,
  ));
}


}

/// @nodoc


class _LoginFailed implements LoginState {
  const _LoginFailed(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginFailedCopyWith<_LoginFailed> get copyWith => __$LoginFailedCopyWithImpl<_LoginFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoginFailedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginFailedCopyWith(_LoginFailed value, $Res Function(_LoginFailed) _then) = __$LoginFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LoginFailedCopyWithImpl<$Res>
    implements _$LoginFailedCopyWith<$Res> {
  __$LoginFailedCopyWithImpl(this._self, this._then);

  final _LoginFailed _self;
  final $Res Function(_LoginFailed) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LoginFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginAuthenticated implements LoginState {
  const _LoginAuthenticated(this.authResponse);
  

 final  GetLoginAuthResponse authResponse;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginAuthenticatedCopyWith<_LoginAuthenticated> get copyWith => __$LoginAuthenticatedCopyWithImpl<_LoginAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginAuthenticated&&(identical(other.authResponse, authResponse) || other.authResponse == authResponse));
}


@override
int get hashCode => Object.hash(runtimeType,authResponse);

@override
String toString() {
  return 'LoginState.authenticated(authResponse: $authResponse)';
}


}

/// @nodoc
abstract mixin class _$LoginAuthenticatedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginAuthenticatedCopyWith(_LoginAuthenticated value, $Res Function(_LoginAuthenticated) _then) = __$LoginAuthenticatedCopyWithImpl;
@useResult
$Res call({
 GetLoginAuthResponse authResponse
});




}
/// @nodoc
class __$LoginAuthenticatedCopyWithImpl<$Res>
    implements _$LoginAuthenticatedCopyWith<$Res> {
  __$LoginAuthenticatedCopyWithImpl(this._self, this._then);

  final _LoginAuthenticated _self;
  final $Res Function(_LoginAuthenticated) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authResponse = null,}) {
  return _then(_LoginAuthenticated(
null == authResponse ? _self.authResponse : authResponse // ignore: cast_nullable_to_non_nullable
as GetLoginAuthResponse,
  ));
}


}

/// @nodoc


class _LoginUnauthenticated implements LoginState {
  const _LoginUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.unauthenticated()';
}


}




// dart format on
