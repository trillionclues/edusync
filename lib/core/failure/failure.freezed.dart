// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServerFailureImpl extends ServerFailure {
  const _$ServerFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends AuthFailure {
  const factory ServerFailure() = _$ServerFailureImpl;
  const ServerFailure._() : super._();
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NetworkFailureImpl extends NetworkFailure {
  const _$NetworkFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.networkError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure extends AuthFailure {
  const factory NetworkFailure() = _$NetworkFailureImpl;
  const NetworkFailure._() : super._();
}

/// @nodoc
abstract class _$$InvalidCredentialsFailureImplCopyWith<$Res> {
  factory _$$InvalidCredentialsFailureImplCopyWith(
          _$InvalidCredentialsFailureImpl value,
          $Res Function(_$InvalidCredentialsFailureImpl) then) =
      __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidCredentialsFailureImpl>
    implements _$$InvalidCredentialsFailureImplCopyWith<$Res> {
  __$$InvalidCredentialsFailureImplCopyWithImpl(
      _$InvalidCredentialsFailureImpl _value,
      $Res Function(_$InvalidCredentialsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InvalidCredentialsFailureImpl extends InvalidCredentialsFailure {
  const _$InvalidCredentialsFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.invalidCredentials()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return invalidCredentials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return invalidCredentials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialsFailure extends AuthFailure {
  const factory InvalidCredentialsFailure() = _$InvalidCredentialsFailureImpl;
  const InvalidCredentialsFailure._() : super._();
}

/// @nodoc
abstract class _$$EmailAlreadyInUseFailureImplCopyWith<$Res> {
  factory _$$EmailAlreadyInUseFailureImplCopyWith(
          _$EmailAlreadyInUseFailureImpl value,
          $Res Function(_$EmailAlreadyInUseFailureImpl) then) =
      __$$EmailAlreadyInUseFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailAlreadyInUseFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$EmailAlreadyInUseFailureImpl>
    implements _$$EmailAlreadyInUseFailureImplCopyWith<$Res> {
  __$$EmailAlreadyInUseFailureImplCopyWithImpl(
      _$EmailAlreadyInUseFailureImpl _value,
      $Res Function(_$EmailAlreadyInUseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmailAlreadyInUseFailureImpl extends EmailAlreadyInUseFailure {
  const _$EmailAlreadyInUseFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyInUseFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUseFailure extends AuthFailure {
  const factory EmailAlreadyInUseFailure() = _$EmailAlreadyInUseFailureImpl;
  const EmailAlreadyInUseFailure._() : super._();
}

/// @nodoc
abstract class _$$WeakPasswordFailureImplCopyWith<$Res> {
  factory _$$WeakPasswordFailureImplCopyWith(_$WeakPasswordFailureImpl value,
          $Res Function(_$WeakPasswordFailureImpl) then) =
      __$$WeakPasswordFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeakPasswordFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$WeakPasswordFailureImpl>
    implements _$$WeakPasswordFailureImplCopyWith<$Res> {
  __$$WeakPasswordFailureImplCopyWithImpl(_$WeakPasswordFailureImpl _value,
      $Res Function(_$WeakPasswordFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeakPasswordFailureImpl extends WeakPasswordFailure {
  const _$WeakPasswordFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.weakPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeakPasswordFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return weakPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return weakPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return weakPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return weakPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (weakPassword != null) {
      return weakPassword(this);
    }
    return orElse();
  }
}

abstract class WeakPasswordFailure extends AuthFailure {
  const factory WeakPasswordFailure() = _$WeakPasswordFailureImpl;
  const WeakPasswordFailure._() : super._();
}

/// @nodoc
abstract class _$$UserNotFoundFailureImplCopyWith<$Res> {
  factory _$$UserNotFoundFailureImplCopyWith(_$UserNotFoundFailureImpl value,
          $Res Function(_$UserNotFoundFailureImpl) then) =
      __$$UserNotFoundFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserNotFoundFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$UserNotFoundFailureImpl>
    implements _$$UserNotFoundFailureImplCopyWith<$Res> {
  __$$UserNotFoundFailureImplCopyWithImpl(_$UserNotFoundFailureImpl _value,
      $Res Function(_$UserNotFoundFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserNotFoundFailureImpl extends UserNotFoundFailure {
  const _$UserNotFoundFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.userNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotFoundFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return userNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class UserNotFoundFailure extends AuthFailure {
  const factory UserNotFoundFailure() = _$UserNotFoundFailureImpl;
  const UserNotFoundFailure._() : super._();
}

/// @nodoc
abstract class _$$CancelledByUserFailureImplCopyWith<$Res> {
  factory _$$CancelledByUserFailureImplCopyWith(
          _$CancelledByUserFailureImpl value,
          $Res Function(_$CancelledByUserFailureImpl) then) =
      __$$CancelledByUserFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledByUserFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$CancelledByUserFailureImpl>
    implements _$$CancelledByUserFailureImplCopyWith<$Res> {
  __$$CancelledByUserFailureImplCopyWithImpl(
      _$CancelledByUserFailureImpl _value,
      $Res Function(_$CancelledByUserFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CancelledByUserFailureImpl extends CancelledByUserFailure {
  const _$CancelledByUserFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.cancelledByUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledByUserFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return cancelledByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return cancelledByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return cancelledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUserFailure extends AuthFailure {
  const factory CancelledByUserFailure() = _$CancelledByUserFailureImpl;
  const CancelledByUserFailure._() : super._();
}

/// @nodoc
abstract class _$$InvalidEmailFailureImplCopyWith<$Res> {
  factory _$$InvalidEmailFailureImplCopyWith(_$InvalidEmailFailureImpl value,
          $Res Function(_$InvalidEmailFailureImpl) then) =
      __$$InvalidEmailFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidEmailFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$InvalidEmailFailureImpl>
    implements _$$InvalidEmailFailureImplCopyWith<$Res> {
  __$$InvalidEmailFailureImplCopyWithImpl(_$InvalidEmailFailureImpl _value,
      $Res Function(_$InvalidEmailFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InvalidEmailFailureImpl extends InvalidEmailFailure {
  const _$InvalidEmailFailureImpl() : super._();

  @override
  String toString() {
    return 'AuthFailure.invalidEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmailFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() weakPassword,
    required TResult Function() userNotFound,
    required TResult Function() cancelledByUser,
    required TResult Function() invalidEmail,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? serverError,
    TResult? Function()? networkError,
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function()? weakPassword,
    TResult? Function()? userNotFound,
    TResult? Function()? cancelledByUser,
    TResult? Function()? invalidEmail,
  }) {
    return invalidEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? weakPassword,
    TResult Function()? userNotFound,
    TResult Function()? cancelledByUser,
    TResult Function()? invalidEmail,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(NetworkFailure value) networkError,
    required TResult Function(InvalidCredentialsFailure value)
        invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(WeakPasswordFailure value) weakPassword,
    required TResult Function(UserNotFoundFailure value) userNotFound,
    required TResult Function(CancelledByUserFailure value) cancelledByUser,
    required TResult Function(InvalidEmailFailure value) invalidEmail,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(NetworkFailure value)? networkError,
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(WeakPasswordFailure value)? weakPassword,
    TResult? Function(UserNotFoundFailure value)? userNotFound,
    TResult? Function(CancelledByUserFailure value)? cancelledByUser,
    TResult? Function(InvalidEmailFailure value)? invalidEmail,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(NetworkFailure value)? networkError,
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(WeakPasswordFailure value)? weakPassword,
    TResult Function(UserNotFoundFailure value)? userNotFound,
    TResult Function(CancelledByUserFailure value)? cancelledByUser,
    TResult Function(InvalidEmailFailure value)? invalidEmail,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailFailure extends AuthFailure {
  const factory InvalidEmailFailure() = _$InvalidEmailFailureImpl;
  const InvalidEmailFailure._() : super._();
}
