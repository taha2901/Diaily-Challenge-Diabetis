// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DoctorsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() doctorLoading,
    required TResult Function(List<DoctorResponseBody> doctor) doctorSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) doctorError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? doctorLoading,
    TResult? Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? doctorError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? doctorLoading,
    TResult Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? doctorError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DoctorLoading value) doctorLoading,
    required TResult Function(DoctorSuccess value) doctorSuccess,
    required TResult Function(DoctorError value) doctorError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DoctorLoading value)? doctorLoading,
    TResult? Function(DoctorSuccess value)? doctorSuccess,
    TResult? Function(DoctorError value)? doctorError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DoctorLoading value)? doctorLoading,
    TResult Function(DoctorSuccess value)? doctorSuccess,
    TResult Function(DoctorError value)? doctorError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorsStateCopyWith<$Res> {
  factory $DoctorsStateCopyWith(
    DoctorsState value,
    $Res Function(DoctorsState) then,
  ) = _$DoctorsStateCopyWithImpl<$Res, DoctorsState>;
}

/// @nodoc
class _$DoctorsStateCopyWithImpl<$Res, $Val extends DoctorsState>
    implements $DoctorsStateCopyWith<$Res> {
  _$DoctorsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorsState
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
    extends _$DoctorsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DoctorsState.initial()';
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
    required TResult Function() doctorLoading,
    required TResult Function(List<DoctorResponseBody> doctor) doctorSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) doctorError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? doctorLoading,
    TResult? Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? doctorError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? doctorLoading,
    TResult Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? doctorError,
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
    required TResult Function(DoctorLoading value) doctorLoading,
    required TResult Function(DoctorSuccess value) doctorSuccess,
    required TResult Function(DoctorError value) doctorError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DoctorLoading value)? doctorLoading,
    TResult? Function(DoctorSuccess value)? doctorSuccess,
    TResult? Function(DoctorError value)? doctorError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DoctorLoading value)? doctorLoading,
    TResult Function(DoctorSuccess value)? doctorSuccess,
    TResult Function(DoctorError value)? doctorError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DoctorsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DoctorLoadingImplCopyWith<$Res> {
  factory _$$DoctorLoadingImplCopyWith(
    _$DoctorLoadingImpl value,
    $Res Function(_$DoctorLoadingImpl) then,
  ) = __$$DoctorLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DoctorLoadingImplCopyWithImpl<$Res>
    extends _$DoctorsStateCopyWithImpl<$Res, _$DoctorLoadingImpl>
    implements _$$DoctorLoadingImplCopyWith<$Res> {
  __$$DoctorLoadingImplCopyWithImpl(
    _$DoctorLoadingImpl _value,
    $Res Function(_$DoctorLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DoctorLoadingImpl implements DoctorLoading {
  const _$DoctorLoadingImpl();

  @override
  String toString() {
    return 'DoctorsState.doctorLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DoctorLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() doctorLoading,
    required TResult Function(List<DoctorResponseBody> doctor) doctorSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) doctorError,
  }) {
    return doctorLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? doctorLoading,
    TResult? Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? doctorError,
  }) {
    return doctorLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? doctorLoading,
    TResult Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? doctorError,
    required TResult orElse(),
  }) {
    if (doctorLoading != null) {
      return doctorLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DoctorLoading value) doctorLoading,
    required TResult Function(DoctorSuccess value) doctorSuccess,
    required TResult Function(DoctorError value) doctorError,
  }) {
    return doctorLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DoctorLoading value)? doctorLoading,
    TResult? Function(DoctorSuccess value)? doctorSuccess,
    TResult? Function(DoctorError value)? doctorError,
  }) {
    return doctorLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DoctorLoading value)? doctorLoading,
    TResult Function(DoctorSuccess value)? doctorSuccess,
    TResult Function(DoctorError value)? doctorError,
    required TResult orElse(),
  }) {
    if (doctorLoading != null) {
      return doctorLoading(this);
    }
    return orElse();
  }
}

abstract class DoctorLoading implements DoctorsState {
  const factory DoctorLoading() = _$DoctorLoadingImpl;
}

/// @nodoc
abstract class _$$DoctorSuccessImplCopyWith<$Res> {
  factory _$$DoctorSuccessImplCopyWith(
    _$DoctorSuccessImpl value,
    $Res Function(_$DoctorSuccessImpl) then,
  ) = __$$DoctorSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DoctorResponseBody> doctor});
}

/// @nodoc
class __$$DoctorSuccessImplCopyWithImpl<$Res>
    extends _$DoctorsStateCopyWithImpl<$Res, _$DoctorSuccessImpl>
    implements _$$DoctorSuccessImplCopyWith<$Res> {
  __$$DoctorSuccessImplCopyWithImpl(
    _$DoctorSuccessImpl _value,
    $Res Function(_$DoctorSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? doctor = null}) {
    return _then(
      _$DoctorSuccessImpl(
        doctor: null == doctor
            ? _value._doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as List<DoctorResponseBody>,
      ),
    );
  }
}

/// @nodoc

class _$DoctorSuccessImpl implements DoctorSuccess {
  const _$DoctorSuccessImpl({required final List<DoctorResponseBody> doctor})
    : _doctor = doctor;

  final List<DoctorResponseBody> _doctor;
  @override
  List<DoctorResponseBody> get doctor {
    if (_doctor is EqualUnmodifiableListView) return _doctor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctor);
  }

  @override
  String toString() {
    return 'DoctorsState.doctorSuccess(doctor: $doctor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorSuccessImpl &&
            const DeepCollectionEquality().equals(other._doctor, _doctor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_doctor));

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorSuccessImplCopyWith<_$DoctorSuccessImpl> get copyWith =>
      __$$DoctorSuccessImplCopyWithImpl<_$DoctorSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() doctorLoading,
    required TResult Function(List<DoctorResponseBody> doctor) doctorSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) doctorError,
  }) {
    return doctorSuccess(doctor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? doctorLoading,
    TResult? Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? doctorError,
  }) {
    return doctorSuccess?.call(doctor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? doctorLoading,
    TResult Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? doctorError,
    required TResult orElse(),
  }) {
    if (doctorSuccess != null) {
      return doctorSuccess(doctor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DoctorLoading value) doctorLoading,
    required TResult Function(DoctorSuccess value) doctorSuccess,
    required TResult Function(DoctorError value) doctorError,
  }) {
    return doctorSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DoctorLoading value)? doctorLoading,
    TResult? Function(DoctorSuccess value)? doctorSuccess,
    TResult? Function(DoctorError value)? doctorError,
  }) {
    return doctorSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DoctorLoading value)? doctorLoading,
    TResult Function(DoctorSuccess value)? doctorSuccess,
    TResult Function(DoctorError value)? doctorError,
    required TResult orElse(),
  }) {
    if (doctorSuccess != null) {
      return doctorSuccess(this);
    }
    return orElse();
  }
}

abstract class DoctorSuccess implements DoctorsState {
  const factory DoctorSuccess({
    required final List<DoctorResponseBody> doctor,
  }) = _$DoctorSuccessImpl;

  List<DoctorResponseBody> get doctor;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorSuccessImplCopyWith<_$DoctorSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorErrorImplCopyWith<$Res> {
  factory _$$DoctorErrorImplCopyWith(
    _$DoctorErrorImpl value,
    $Res Function(_$DoctorErrorImpl) then,
  ) = __$$DoctorErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$DoctorErrorImplCopyWithImpl<$Res>
    extends _$DoctorsStateCopyWithImpl<$Res, _$DoctorErrorImpl>
    implements _$$DoctorErrorImplCopyWith<$Res> {
  __$$DoctorErrorImplCopyWithImpl(
    _$DoctorErrorImpl _value,
    $Res Function(_$DoctorErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiErrorModel = null}) {
    return _then(
      _$DoctorErrorImpl(
        null == apiErrorModel
            ? _value.apiErrorModel
            : apiErrorModel // ignore: cast_nullable_to_non_nullable
                  as ApiErrorModel,
      ),
    );
  }
}

/// @nodoc

class _$DoctorErrorImpl implements DoctorError {
  const _$DoctorErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'DoctorsState.doctorError(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorErrorImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorErrorImplCopyWith<_$DoctorErrorImpl> get copyWith =>
      __$$DoctorErrorImplCopyWithImpl<_$DoctorErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() doctorLoading,
    required TResult Function(List<DoctorResponseBody> doctor) doctorSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) doctorError,
  }) {
    return doctorError(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? doctorLoading,
    TResult? Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? doctorError,
  }) {
    return doctorError?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? doctorLoading,
    TResult Function(List<DoctorResponseBody> doctor)? doctorSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? doctorError,
    required TResult orElse(),
  }) {
    if (doctorError != null) {
      return doctorError(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(DoctorLoading value) doctorLoading,
    required TResult Function(DoctorSuccess value) doctorSuccess,
    required TResult Function(DoctorError value) doctorError,
  }) {
    return doctorError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(DoctorLoading value)? doctorLoading,
    TResult? Function(DoctorSuccess value)? doctorSuccess,
    TResult? Function(DoctorError value)? doctorError,
  }) {
    return doctorError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(DoctorLoading value)? doctorLoading,
    TResult Function(DoctorSuccess value)? doctorSuccess,
    TResult Function(DoctorError value)? doctorError,
    required TResult orElse(),
  }) {
    if (doctorError != null) {
      return doctorError(this);
    }
    return orElse();
  }
}

abstract class DoctorError implements DoctorsState {
  const factory DoctorError(final ApiErrorModel apiErrorModel) =
      _$DoctorErrorImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of DoctorsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorErrorImplCopyWith<_$DoctorErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
