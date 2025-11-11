// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_otp_email_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationOtpEmailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationOtpEmailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationOtpEmailEvent()';
}


}

/// @nodoc
class $VerificationOtpEmailEventCopyWith<$Res>  {
$VerificationOtpEmailEventCopyWith(VerificationOtpEmailEvent _, $Res Function(VerificationOtpEmailEvent) __);
}


/// Adds pattern-matching-related methods to [VerificationOtpEmailEvent].
extension VerificationOtpEmailEventPatterns on VerificationOtpEmailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _VerificationEmailOtp value)?  verificationEmailOtp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _VerificationEmailOtp() when verificationEmailOtp != null:
return verificationEmailOtp(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _VerificationEmailOtp value)  verificationEmailOtp,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _VerificationEmailOtp():
return verificationEmailOtp(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _VerificationEmailOtp value)?  verificationEmailOtp,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _VerificationEmailOtp() when verificationEmailOtp != null:
return verificationEmailOtp(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String otp)?  verificationEmailOtp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _VerificationEmailOtp() when verificationEmailOtp != null:
return verificationEmailOtp(_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String otp)  verificationEmailOtp,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _VerificationEmailOtp():
return verificationEmailOtp(_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String otp)?  verificationEmailOtp,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _VerificationEmailOtp() when verificationEmailOtp != null:
return verificationEmailOtp(_that.otp);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VerificationOtpEmailEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationOtpEmailEvent.started()';
}


}




/// @nodoc


class _VerificationEmailOtp implements VerificationOtpEmailEvent {
  const _VerificationEmailOtp(this.otp);
  

 final  String otp;

/// Create a copy of VerificationOtpEmailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationEmailOtpCopyWith<_VerificationEmailOtp> get copyWith => __$VerificationEmailOtpCopyWithImpl<_VerificationEmailOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationEmailOtp&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'VerificationOtpEmailEvent.verificationEmailOtp(otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerificationEmailOtpCopyWith<$Res> implements $VerificationOtpEmailEventCopyWith<$Res> {
  factory _$VerificationEmailOtpCopyWith(_VerificationEmailOtp value, $Res Function(_VerificationEmailOtp) _then) = __$VerificationEmailOtpCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class __$VerificationEmailOtpCopyWithImpl<$Res>
    implements _$VerificationEmailOtpCopyWith<$Res> {
  __$VerificationEmailOtpCopyWithImpl(this._self, this._then);

  final _VerificationEmailOtp _self;
  final $Res Function(_VerificationEmailOtp) _then;

/// Create a copy of VerificationOtpEmailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(_VerificationEmailOtp(
null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VerificationOtpEmailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationOtpEmailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationOtpEmailState()';
}


}

/// @nodoc
class $VerificationOtpEmailStateCopyWith<$Res>  {
$VerificationOtpEmailStateCopyWith(VerificationOtpEmailState _, $Res Function(VerificationOtpEmailState) __);
}


/// Adds pattern-matching-related methods to [VerificationOtpEmailState].
extension VerificationOtpEmailStatePatterns on VerificationOtpEmailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SendOtpVerificationResponse sendEmailOtp)?  success,TResult Function( String message)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.sendEmailOtp);case _Failed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SendOtpVerificationResponse sendEmailOtp)  success,required TResult Function( String message)  failed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.sendEmailOtp);case _Failed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SendOtpVerificationResponse sendEmailOtp)?  success,TResult? Function( String message)?  failed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.sendEmailOtp);case _Failed() when failed != null:
return failed(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements VerificationOtpEmailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationOtpEmailState.initial()';
}


}




/// @nodoc


class _Loading implements VerificationOtpEmailState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerificationOtpEmailState.loading()';
}


}




/// @nodoc


class _Success implements VerificationOtpEmailState {
  const _Success(this.sendEmailOtp);
  

 final  SendOtpVerificationResponse sendEmailOtp;

/// Create a copy of VerificationOtpEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.sendEmailOtp, sendEmailOtp) || other.sendEmailOtp == sendEmailOtp));
}


@override
int get hashCode => Object.hash(runtimeType,sendEmailOtp);

@override
String toString() {
  return 'VerificationOtpEmailState.success(sendEmailOtp: $sendEmailOtp)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $VerificationOtpEmailStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 SendOtpVerificationResponse sendEmailOtp
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of VerificationOtpEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sendEmailOtp = null,}) {
  return _then(_Success(
null == sendEmailOtp ? _self.sendEmailOtp : sendEmailOtp // ignore: cast_nullable_to_non_nullable
as SendOtpVerificationResponse,
  ));
}


}

/// @nodoc


class _Failed implements VerificationOtpEmailState {
  const _Failed(this.message);
  

 final  String message;

/// Create a copy of VerificationOtpEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedCopyWith<_Failed> get copyWith => __$FailedCopyWithImpl<_Failed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VerificationOtpEmailState.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $VerificationOtpEmailStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of VerificationOtpEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
