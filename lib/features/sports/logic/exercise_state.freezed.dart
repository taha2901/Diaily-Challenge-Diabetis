// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExerciseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExerciseLoading value) loading,
    required TResult Function(ExerciseSuccess value) success,
    required TResult Function(ExerciseError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExerciseLoading value)? loading,
    TResult? Function(ExerciseSuccess value)? success,
    TResult? Function(ExerciseError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExerciseLoading value)? loading,
    TResult Function(ExerciseSuccess value)? success,
    TResult Function(ExerciseError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStateCopyWith<$Res> {
  factory $ExerciseStateCopyWith(
    ExerciseState value,
    $Res Function(ExerciseState) then,
  ) = _$ExerciseStateCopyWithImpl<$Res, ExerciseState>;
}

/// @nodoc
class _$ExerciseStateCopyWithImpl<$Res, $Val extends ExerciseState>
    implements $ExerciseStateCopyWith<$Res> {
  _$ExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ExerciseState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExerciseLoading value) loading,
    required TResult Function(ExerciseSuccess value) success,
    required TResult Function(ExerciseError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExerciseLoading value)? loading,
    TResult? Function(ExerciseSuccess value)? success,
    TResult? Function(ExerciseError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExerciseLoading value)? loading,
    TResult Function(ExerciseSuccess value)? success,
    TResult Function(ExerciseError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ExerciseState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ExerciseLoadingImplCopyWith<$Res> {
  factory _$$ExerciseLoadingImplCopyWith(
    _$ExerciseLoadingImpl value,
    $Res Function(_$ExerciseLoadingImpl) then,
  ) = __$$ExerciseLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExerciseLoadingImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$ExerciseLoadingImpl>
    implements _$$ExerciseLoadingImplCopyWith<$Res> {
  __$$ExerciseLoadingImplCopyWithImpl(
    _$ExerciseLoadingImpl _value,
    $Res Function(_$ExerciseLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExerciseLoadingImpl implements ExerciseLoading {
  const _$ExerciseLoadingImpl();

  @override
  String toString() {
    return 'ExerciseState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExerciseLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExerciseLoading value) loading,
    required TResult Function(ExerciseSuccess value) success,
    required TResult Function(ExerciseError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExerciseLoading value)? loading,
    TResult? Function(ExerciseSuccess value)? success,
    TResult? Function(ExerciseError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExerciseLoading value)? loading,
    TResult Function(ExerciseSuccess value)? success,
    TResult Function(ExerciseError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExerciseLoading implements ExerciseState {
  const factory ExerciseLoading() = _$ExerciseLoadingImpl;
}

/// @nodoc
abstract class _$$ExerciseSuccessImplCopyWith<$Res> {
  factory _$$ExerciseSuccessImplCopyWith(
    _$ExerciseSuccessImpl value,
    $Res Function(_$ExerciseSuccessImpl) then,
  ) = __$$ExerciseSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExerciseSuccessImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$ExerciseSuccessImpl>
    implements _$$ExerciseSuccessImplCopyWith<$Res> {
  __$$ExerciseSuccessImplCopyWithImpl(
    _$ExerciseSuccessImpl _value,
    $Res Function(_$ExerciseSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExerciseSuccessImpl implements ExerciseSuccess {
  const _$ExerciseSuccessImpl();

  @override
  String toString() {
    return 'ExerciseState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExerciseSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExerciseLoading value) loading,
    required TResult Function(ExerciseSuccess value) success,
    required TResult Function(ExerciseError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExerciseLoading value)? loading,
    TResult? Function(ExerciseSuccess value)? success,
    TResult? Function(ExerciseError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExerciseLoading value)? loading,
    TResult Function(ExerciseSuccess value)? success,
    TResult Function(ExerciseError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ExerciseSuccess implements ExerciseState {
  const factory ExerciseSuccess() = _$ExerciseSuccessImpl;
}

/// @nodoc
abstract class _$$ExerciseErrorImplCopyWith<$Res> {
  factory _$$ExerciseErrorImplCopyWith(
    _$ExerciseErrorImpl value,
    $Res Function(_$ExerciseErrorImpl) then,
  ) = __$$ExerciseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$ExerciseErrorImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$ExerciseErrorImpl>
    implements _$$ExerciseErrorImplCopyWith<$Res> {
  __$$ExerciseErrorImplCopyWithImpl(
    _$ExerciseErrorImpl _value,
    $Res Function(_$ExerciseErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiErrorModel = null}) {
    return _then(
      _$ExerciseErrorImpl(
        null == apiErrorModel
            ? _value.apiErrorModel
            : apiErrorModel // ignore: cast_nullable_to_non_nullable
                  as ApiErrorModel,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseErrorImpl implements ExerciseError {
  const _$ExerciseErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'ExerciseState.error(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseErrorImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseErrorImplCopyWith<_$ExerciseErrorImpl> get copyWith =>
      __$$ExerciseErrorImplCopyWithImpl<_$ExerciseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
  }) {
    return error(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
  }) {
    return error?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExerciseLoading value) loading,
    required TResult Function(ExerciseSuccess value) success,
    required TResult Function(ExerciseError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExerciseLoading value)? loading,
    TResult? Function(ExerciseSuccess value)? success,
    TResult? Function(ExerciseError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExerciseLoading value)? loading,
    TResult Function(ExerciseSuccess value)? success,
    TResult Function(ExerciseError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ExerciseError implements ExerciseState {
  const factory ExerciseError(final ApiErrorModel apiErrorModel) =
      _$ExerciseErrorImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseErrorImplCopyWith<_$ExerciseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
