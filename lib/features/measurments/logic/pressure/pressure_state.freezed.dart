// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pressure_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PressureState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PressureStateCopyWith<$Res> {
  factory $PressureStateCopyWith(
    PressureState value,
    $Res Function(PressureState) then,
  ) = _$PressureStateCopyWithImpl<$Res, PressureState>;
}

/// @nodoc
class _$PressureStateCopyWithImpl<$Res, $Val extends PressureState>
    implements $PressureStateCopyWith<$Res> {
  _$PressureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PressureState
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
    extends _$PressureStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PressureState.initial()';
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
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
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
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PressureState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddBloodPressureLoadingImplCopyWith<$Res> {
  factory _$$AddBloodPressureLoadingImplCopyWith(
    _$AddBloodPressureLoadingImpl value,
    $Res Function(_$AddBloodPressureLoadingImpl) then,
  ) = __$$AddBloodPressureLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddBloodPressureLoadingImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$AddBloodPressureLoadingImpl>
    implements _$$AddBloodPressureLoadingImplCopyWith<$Res> {
  __$$AddBloodPressureLoadingImplCopyWithImpl(
    _$AddBloodPressureLoadingImpl _value,
    $Res Function(_$AddBloodPressureLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddBloodPressureLoadingImpl implements AddBloodPressureLoading {
  const _$AddBloodPressureLoadingImpl();

  @override
  String toString() {
    return 'PressureState.addBloodPressureLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBloodPressureLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return addBloodPressureLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return addBloodPressureLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (addBloodPressureLoading != null) {
      return addBloodPressureLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return addBloodPressureLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return addBloodPressureLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (addBloodPressureLoading != null) {
      return addBloodPressureLoading(this);
    }
    return orElse();
  }
}

abstract class AddBloodPressureLoading implements PressureState {
  const factory AddBloodPressureLoading() = _$AddBloodPressureLoadingImpl;
}

/// @nodoc
abstract class _$$AddBloodPressureSuccessImplCopyWith<$Res> {
  factory _$$AddBloodPressureSuccessImplCopyWith(
    _$AddBloodPressureSuccessImpl value,
    $Res Function(_$AddBloodPressureSuccessImpl) then,
  ) = __$$AddBloodPressureSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddBloodPressureSuccessImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$AddBloodPressureSuccessImpl>
    implements _$$AddBloodPressureSuccessImplCopyWith<$Res> {
  __$$AddBloodPressureSuccessImplCopyWithImpl(
    _$AddBloodPressureSuccessImpl _value,
    $Res Function(_$AddBloodPressureSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddBloodPressureSuccessImpl implements AddBloodPressureSuccess {
  const _$AddBloodPressureSuccessImpl();

  @override
  String toString() {
    return 'PressureState.addBloodPressureSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBloodPressureSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return addBloodPressureSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return addBloodPressureSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (addBloodPressureSuccess != null) {
      return addBloodPressureSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return addBloodPressureSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return addBloodPressureSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (addBloodPressureSuccess != null) {
      return addBloodPressureSuccess(this);
    }
    return orElse();
  }
}

abstract class AddBloodPressureSuccess implements PressureState {
  const factory AddBloodPressureSuccess() = _$AddBloodPressureSuccessImpl;
}

/// @nodoc
abstract class _$$AddBloodPressureErrorImplCopyWith<$Res> {
  factory _$$AddBloodPressureErrorImplCopyWith(
    _$AddBloodPressureErrorImpl value,
    $Res Function(_$AddBloodPressureErrorImpl) then,
  ) = __$$AddBloodPressureErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddBloodPressureErrorImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$AddBloodPressureErrorImpl>
    implements _$$AddBloodPressureErrorImplCopyWith<$Res> {
  __$$AddBloodPressureErrorImplCopyWithImpl(
    _$AddBloodPressureErrorImpl _value,
    $Res Function(_$AddBloodPressureErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddBloodPressureErrorImpl implements AddBloodPressureError {
  const _$AddBloodPressureErrorImpl();

  @override
  String toString() {
    return 'PressureState.addBloodPressureError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBloodPressureErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return addBloodPressureError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return addBloodPressureError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (addBloodPressureError != null) {
      return addBloodPressureError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return addBloodPressureError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return addBloodPressureError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (addBloodPressureError != null) {
      return addBloodPressureError(this);
    }
    return orElse();
  }
}

abstract class AddBloodPressureError implements PressureState {
  const factory AddBloodPressureError() = _$AddBloodPressureErrorImpl;
}

/// @nodoc
abstract class _$$GetBloodPressureLoadingImplCopyWith<$Res> {
  factory _$$GetBloodPressureLoadingImplCopyWith(
    _$GetBloodPressureLoadingImpl value,
    $Res Function(_$GetBloodPressureLoadingImpl) then,
  ) = __$$GetBloodPressureLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBloodPressureLoadingImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$GetBloodPressureLoadingImpl>
    implements _$$GetBloodPressureLoadingImplCopyWith<$Res> {
  __$$GetBloodPressureLoadingImplCopyWithImpl(
    _$GetBloodPressureLoadingImpl _value,
    $Res Function(_$GetBloodPressureLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetBloodPressureLoadingImpl implements GetBloodPressureLoading {
  const _$GetBloodPressureLoadingImpl();

  @override
  String toString() {
    return 'PressureState.getBloodPressureLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBloodPressureLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return getBloodPressureLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return getBloodPressureLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureLoading != null) {
      return getBloodPressureLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return getBloodPressureLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return getBloodPressureLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureLoading != null) {
      return getBloodPressureLoading(this);
    }
    return orElse();
  }
}

abstract class GetBloodPressureLoading implements PressureState {
  const factory GetBloodPressureLoading() = _$GetBloodPressureLoadingImpl;
}

/// @nodoc
abstract class _$$GetBloodPressureSuccessImplCopyWith<$Res> {
  factory _$$GetBloodPressureSuccessImplCopyWith(
    _$GetBloodPressureSuccessImpl value,
    $Res Function(_$GetBloodPressureSuccessImpl) then,
  ) = __$$GetBloodPressureSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BloodPressureMeasurement> bloodPressure, int heartRate});
}

/// @nodoc
class __$$GetBloodPressureSuccessImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$GetBloodPressureSuccessImpl>
    implements _$$GetBloodPressureSuccessImplCopyWith<$Res> {
  __$$GetBloodPressureSuccessImplCopyWithImpl(
    _$GetBloodPressureSuccessImpl _value,
    $Res Function(_$GetBloodPressureSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bloodPressure = null, Object? heartRate = null}) {
    return _then(
      _$GetBloodPressureSuccessImpl(
        bloodPressure: null == bloodPressure
            ? _value._bloodPressure
            : bloodPressure // ignore: cast_nullable_to_non_nullable
                  as List<BloodPressureMeasurement>,
        heartRate: null == heartRate
            ? _value.heartRate
            : heartRate // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetBloodPressureSuccessImpl implements GetBloodPressureSuccess {
  const _$GetBloodPressureSuccessImpl({
    required final List<BloodPressureMeasurement> bloodPressure,
    required this.heartRate,
  }) : _bloodPressure = bloodPressure;

  final List<BloodPressureMeasurement> _bloodPressure;
  @override
  List<BloodPressureMeasurement> get bloodPressure {
    if (_bloodPressure is EqualUnmodifiableListView) return _bloodPressure;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bloodPressure);
  }

  @override
  final int heartRate;

  @override
  String toString() {
    return 'PressureState.getBloodPressureSuccess(bloodPressure: $bloodPressure, heartRate: $heartRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBloodPressureSuccessImpl &&
            const DeepCollectionEquality().equals(
              other._bloodPressure,
              _bloodPressure,
            ) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_bloodPressure),
    heartRate,
  );

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBloodPressureSuccessImplCopyWith<_$GetBloodPressureSuccessImpl>
  get copyWith =>
      __$$GetBloodPressureSuccessImplCopyWithImpl<
        _$GetBloodPressureSuccessImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return getBloodPressureSuccess(bloodPressure, heartRate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return getBloodPressureSuccess?.call(bloodPressure, heartRate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureSuccess != null) {
      return getBloodPressureSuccess(bloodPressure, heartRate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return getBloodPressureSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return getBloodPressureSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureSuccess != null) {
      return getBloodPressureSuccess(this);
    }
    return orElse();
  }
}

abstract class GetBloodPressureSuccess implements PressureState {
  const factory GetBloodPressureSuccess({
    required final List<BloodPressureMeasurement> bloodPressure,
    required final int heartRate,
  }) = _$GetBloodPressureSuccessImpl;

  List<BloodPressureMeasurement> get bloodPressure;
  int get heartRate;

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBloodPressureSuccessImplCopyWith<_$GetBloodPressureSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBloodPressureErrorImplCopyWith<$Res> {
  factory _$$GetBloodPressureErrorImplCopyWith(
    _$GetBloodPressureErrorImpl value,
    $Res Function(_$GetBloodPressureErrorImpl) then,
  ) = __$$GetBloodPressureErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBloodPressureErrorImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$GetBloodPressureErrorImpl>
    implements _$$GetBloodPressureErrorImplCopyWith<$Res> {
  __$$GetBloodPressureErrorImplCopyWithImpl(
    _$GetBloodPressureErrorImpl _value,
    $Res Function(_$GetBloodPressureErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetBloodPressureErrorImpl implements GetBloodPressureError {
  const _$GetBloodPressureErrorImpl();

  @override
  String toString() {
    return 'PressureState.getBloodPressureError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBloodPressureErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return getBloodPressureError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return getBloodPressureError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureError != null) {
      return getBloodPressureError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return getBloodPressureError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return getBloodPressureError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureError != null) {
      return getBloodPressureError(this);
    }
    return orElse();
  }
}

abstract class GetBloodPressureError implements PressureState {
  const factory GetBloodPressureError() = _$GetBloodPressureErrorImpl;
}

/// @nodoc
abstract class _$$GetBloodPressureEmptyImplCopyWith<$Res> {
  factory _$$GetBloodPressureEmptyImplCopyWith(
    _$GetBloodPressureEmptyImpl value,
    $Res Function(_$GetBloodPressureEmptyImpl) then,
  ) = __$$GetBloodPressureEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBloodPressureEmptyImplCopyWithImpl<$Res>
    extends _$PressureStateCopyWithImpl<$Res, _$GetBloodPressureEmptyImpl>
    implements _$$GetBloodPressureEmptyImplCopyWith<$Res> {
  __$$GetBloodPressureEmptyImplCopyWithImpl(
    _$GetBloodPressureEmptyImpl _value,
    $Res Function(_$GetBloodPressureEmptyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PressureState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetBloodPressureEmptyImpl implements GetBloodPressureEmpty {
  const _$GetBloodPressureEmptyImpl();

  @override
  String toString() {
    return 'PressureState.getBloodPressureEmpty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBloodPressureEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addBloodPressureLoading,
    required TResult Function() addBloodPressureSuccess,
    required TResult Function() addBloodPressureError,
    required TResult Function() getBloodPressureLoading,
    required TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )
    getBloodPressureSuccess,
    required TResult Function() getBloodPressureError,
    required TResult Function() getBloodPressureEmpty,
  }) {
    return getBloodPressureEmpty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addBloodPressureLoading,
    TResult? Function()? addBloodPressureSuccess,
    TResult? Function()? addBloodPressureError,
    TResult? Function()? getBloodPressureLoading,
    TResult? Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult? Function()? getBloodPressureError,
    TResult? Function()? getBloodPressureEmpty,
  }) {
    return getBloodPressureEmpty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addBloodPressureLoading,
    TResult Function()? addBloodPressureSuccess,
    TResult Function()? addBloodPressureError,
    TResult Function()? getBloodPressureLoading,
    TResult Function(
      List<BloodPressureMeasurement> bloodPressure,
      int heartRate,
    )?
    getBloodPressureSuccess,
    TResult Function()? getBloodPressureError,
    TResult Function()? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureEmpty != null) {
      return getBloodPressureEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddBloodPressureLoading value)
    addBloodPressureLoading,
    required TResult Function(AddBloodPressureSuccess value)
    addBloodPressureSuccess,
    required TResult Function(AddBloodPressureError value)
    addBloodPressureError,
    required TResult Function(GetBloodPressureLoading value)
    getBloodPressureLoading,
    required TResult Function(GetBloodPressureSuccess value)
    getBloodPressureSuccess,
    required TResult Function(GetBloodPressureError value)
    getBloodPressureError,
    required TResult Function(GetBloodPressureEmpty value)
    getBloodPressureEmpty,
  }) {
    return getBloodPressureEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult? Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult? Function(AddBloodPressureError value)? addBloodPressureError,
    TResult? Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult? Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult? Function(GetBloodPressureError value)? getBloodPressureError,
    TResult? Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
  }) {
    return getBloodPressureEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddBloodPressureLoading value)? addBloodPressureLoading,
    TResult Function(AddBloodPressureSuccess value)? addBloodPressureSuccess,
    TResult Function(AddBloodPressureError value)? addBloodPressureError,
    TResult Function(GetBloodPressureLoading value)? getBloodPressureLoading,
    TResult Function(GetBloodPressureSuccess value)? getBloodPressureSuccess,
    TResult Function(GetBloodPressureError value)? getBloodPressureError,
    TResult Function(GetBloodPressureEmpty value)? getBloodPressureEmpty,
    required TResult orElse(),
  }) {
    if (getBloodPressureEmpty != null) {
      return getBloodPressureEmpty(this);
    }
    return orElse();
  }
}

abstract class GetBloodPressureEmpty implements PressureState {
  const factory GetBloodPressureEmpty() = _$GetBloodPressureEmptyImpl;
}
