// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MedicineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineStateCopyWith<$Res> {
  factory $MedicineStateCopyWith(
    MedicineState value,
    $Res Function(MedicineState) then,
  ) = _$MedicineStateCopyWithImpl<$Res, MedicineState>;
}

/// @nodoc
class _$MedicineStateCopyWithImpl<$Res, $Val extends MedicineState>
    implements $MedicineStateCopyWith<$Res> {
  _$MedicineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicineState
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
    extends _$MedicineStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MedicineState.initial()';
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
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
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
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MedicineState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$MedicineLoadingImplCopyWith<$Res> {
  factory _$$MedicineLoadingImplCopyWith(
    _$MedicineLoadingImpl value,
    $Res Function(_$MedicineLoadingImpl) then,
  ) = __$$MedicineLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MedicineLoadingImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$MedicineLoadingImpl>
    implements _$$MedicineLoadingImplCopyWith<$Res> {
  __$$MedicineLoadingImplCopyWithImpl(
    _$MedicineLoadingImpl _value,
    $Res Function(_$MedicineLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MedicineLoadingImpl implements MedicineLoading {
  const _$MedicineLoadingImpl();

  @override
  String toString() {
    return 'MedicineState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MedicineLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
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
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MedicineLoading implements MedicineState {
  const factory MedicineLoading() = _$MedicineLoadingImpl;
}

/// @nodoc
abstract class _$$MedicineSuccessImplCopyWith<$Res> {
  factory _$$MedicineSuccessImplCopyWith(
    _$MedicineSuccessImpl value,
    $Res Function(_$MedicineSuccessImpl) then,
  ) = __$$MedicineSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MedicineResponseBody> medicines});
}

/// @nodoc
class __$$MedicineSuccessImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$MedicineSuccessImpl>
    implements _$$MedicineSuccessImplCopyWith<$Res> {
  __$$MedicineSuccessImplCopyWithImpl(
    _$MedicineSuccessImpl _value,
    $Res Function(_$MedicineSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? medicines = null}) {
    return _then(
      _$MedicineSuccessImpl(
        null == medicines
            ? _value._medicines
            : medicines // ignore: cast_nullable_to_non_nullable
                  as List<MedicineResponseBody>,
      ),
    );
  }
}

/// @nodoc

class _$MedicineSuccessImpl implements MedicineSuccess {
  const _$MedicineSuccessImpl(final List<MedicineResponseBody> medicines)
    : _medicines = medicines;

  final List<MedicineResponseBody> _medicines;
  @override
  List<MedicineResponseBody> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  @override
  String toString() {
    return 'MedicineState.success(medicines: $medicines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineSuccessImpl &&
            const DeepCollectionEquality().equals(
              other._medicines,
              _medicines,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_medicines));

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineSuccessImplCopyWith<_$MedicineSuccessImpl> get copyWith =>
      __$$MedicineSuccessImplCopyWithImpl<_$MedicineSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return success(medicines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return success?.call(medicines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(medicines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MedicineSuccess implements MedicineState {
  const factory MedicineSuccess(final List<MedicineResponseBody> medicines) =
      _$MedicineSuccessImpl;

  List<MedicineResponseBody> get medicines;

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineSuccessImplCopyWith<_$MedicineSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MedicineErrorImplCopyWith<$Res> {
  factory _$$MedicineErrorImplCopyWith(
    _$MedicineErrorImpl value,
    $Res Function(_$MedicineErrorImpl) then,
  ) = __$$MedicineErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$MedicineErrorImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$MedicineErrorImpl>
    implements _$$MedicineErrorImplCopyWith<$Res> {
  __$$MedicineErrorImplCopyWithImpl(
    _$MedicineErrorImpl _value,
    $Res Function(_$MedicineErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiErrorModel = null}) {
    return _then(
      _$MedicineErrorImpl(
        null == apiErrorModel
            ? _value.apiErrorModel
            : apiErrorModel // ignore: cast_nullable_to_non_nullable
                  as ApiErrorModel,
      ),
    );
  }
}

/// @nodoc

class _$MedicineErrorImpl implements MedicineError {
  const _$MedicineErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'MedicineState.error(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineErrorImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineErrorImplCopyWith<_$MedicineErrorImpl> get copyWith =>
      __$$MedicineErrorImplCopyWithImpl<_$MedicineErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return error(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return error?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
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
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MedicineError implements MedicineState {
  const factory MedicineError(final ApiErrorModel apiErrorModel) =
      _$MedicineErrorImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineErrorImplCopyWith<_$MedicineErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddMedicineLoadingImplCopyWith<$Res> {
  factory _$$AddMedicineLoadingImplCopyWith(
    _$AddMedicineLoadingImpl value,
    $Res Function(_$AddMedicineLoadingImpl) then,
  ) = __$$AddMedicineLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddMedicineLoadingImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$AddMedicineLoadingImpl>
    implements _$$AddMedicineLoadingImplCopyWith<$Res> {
  __$$AddMedicineLoadingImplCopyWithImpl(
    _$AddMedicineLoadingImpl _value,
    $Res Function(_$AddMedicineLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddMedicineLoadingImpl implements AddMedicineLoading {
  const _$AddMedicineLoadingImpl();

  @override
  String toString() {
    return 'MedicineState.addMedicineLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddMedicineLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return addMedicineLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return addMedicineLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (addMedicineLoading != null) {
      return addMedicineLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return addMedicineLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return addMedicineLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (addMedicineLoading != null) {
      return addMedicineLoading(this);
    }
    return orElse();
  }
}

abstract class AddMedicineLoading implements MedicineState {
  const factory AddMedicineLoading() = _$AddMedicineLoadingImpl;
}

/// @nodoc
abstract class _$$AddMedicineSuccessImplCopyWith<$Res> {
  factory _$$AddMedicineSuccessImplCopyWith(
    _$AddMedicineSuccessImpl value,
    $Res Function(_$AddMedicineSuccessImpl) then,
  ) = __$$AddMedicineSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddMedicineSuccessImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$AddMedicineSuccessImpl>
    implements _$$AddMedicineSuccessImplCopyWith<$Res> {
  __$$AddMedicineSuccessImplCopyWithImpl(
    _$AddMedicineSuccessImpl _value,
    $Res Function(_$AddMedicineSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddMedicineSuccessImpl implements AddMedicineSuccess {
  const _$AddMedicineSuccessImpl();

  @override
  String toString() {
    return 'MedicineState.addMedicineSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddMedicineSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return addMedicineSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return addMedicineSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (addMedicineSuccess != null) {
      return addMedicineSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return addMedicineSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return addMedicineSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (addMedicineSuccess != null) {
      return addMedicineSuccess(this);
    }
    return orElse();
  }
}

abstract class AddMedicineSuccess implements MedicineState {
  const factory AddMedicineSuccess() = _$AddMedicineSuccessImpl;
}

/// @nodoc
abstract class _$$AddMedicineErrorImplCopyWith<$Res> {
  factory _$$AddMedicineErrorImplCopyWith(
    _$AddMedicineErrorImpl value,
    $Res Function(_$AddMedicineErrorImpl) then,
  ) = __$$AddMedicineErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$AddMedicineErrorImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$AddMedicineErrorImpl>
    implements _$$AddMedicineErrorImplCopyWith<$Res> {
  __$$AddMedicineErrorImplCopyWithImpl(
    _$AddMedicineErrorImpl _value,
    $Res Function(_$AddMedicineErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiErrorModel = null}) {
    return _then(
      _$AddMedicineErrorImpl(
        null == apiErrorModel
            ? _value.apiErrorModel
            : apiErrorModel // ignore: cast_nullable_to_non_nullable
                  as ApiErrorModel,
      ),
    );
  }
}

/// @nodoc

class _$AddMedicineErrorImpl implements AddMedicineError {
  const _$AddMedicineErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'MedicineState.addMedicineError(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMedicineErrorImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMedicineErrorImplCopyWith<_$AddMedicineErrorImpl> get copyWith =>
      __$$AddMedicineErrorImplCopyWithImpl<_$AddMedicineErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return addMedicineError(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return addMedicineError?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (addMedicineError != null) {
      return addMedicineError(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return addMedicineError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return addMedicineError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (addMedicineError != null) {
      return addMedicineError(this);
    }
    return orElse();
  }
}

abstract class AddMedicineError implements MedicineState {
  const factory AddMedicineError(final ApiErrorModel apiErrorModel) =
      _$AddMedicineErrorImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddMedicineErrorImplCopyWith<_$AddMedicineErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMedicineLoadingImplCopyWith<$Res> {
  factory _$$DeleteMedicineLoadingImplCopyWith(
    _$DeleteMedicineLoadingImpl value,
    $Res Function(_$DeleteMedicineLoadingImpl) then,
  ) = __$$DeleteMedicineLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteMedicineLoadingImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$DeleteMedicineLoadingImpl>
    implements _$$DeleteMedicineLoadingImplCopyWith<$Res> {
  __$$DeleteMedicineLoadingImplCopyWithImpl(
    _$DeleteMedicineLoadingImpl _value,
    $Res Function(_$DeleteMedicineLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteMedicineLoadingImpl implements DeleteMedicineLoading {
  const _$DeleteMedicineLoadingImpl();

  @override
  String toString() {
    return 'MedicineState.deleteMedicineLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMedicineLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return deleteMedicineLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return deleteMedicineLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (deleteMedicineLoading != null) {
      return deleteMedicineLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return deleteMedicineLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return deleteMedicineLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (deleteMedicineLoading != null) {
      return deleteMedicineLoading(this);
    }
    return orElse();
  }
}

abstract class DeleteMedicineLoading implements MedicineState {
  const factory DeleteMedicineLoading() = _$DeleteMedicineLoadingImpl;
}

/// @nodoc
abstract class _$$DeleteMedicineSuccessImplCopyWith<$Res> {
  factory _$$DeleteMedicineSuccessImplCopyWith(
    _$DeleteMedicineSuccessImpl value,
    $Res Function(_$DeleteMedicineSuccessImpl) then,
  ) = __$$DeleteMedicineSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteMedicineSuccessImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$DeleteMedicineSuccessImpl>
    implements _$$DeleteMedicineSuccessImplCopyWith<$Res> {
  __$$DeleteMedicineSuccessImplCopyWithImpl(
    _$DeleteMedicineSuccessImpl _value,
    $Res Function(_$DeleteMedicineSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteMedicineSuccessImpl implements DeleteMedicineSuccess {
  const _$DeleteMedicineSuccessImpl();

  @override
  String toString() {
    return 'MedicineState.deleteMedicineSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMedicineSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return deleteMedicineSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return deleteMedicineSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (deleteMedicineSuccess != null) {
      return deleteMedicineSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return deleteMedicineSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return deleteMedicineSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (deleteMedicineSuccess != null) {
      return deleteMedicineSuccess(this);
    }
    return orElse();
  }
}

abstract class DeleteMedicineSuccess implements MedicineState {
  const factory DeleteMedicineSuccess() = _$DeleteMedicineSuccessImpl;
}

/// @nodoc
abstract class _$$DeleteMedicineErrorImplCopyWith<$Res> {
  factory _$$DeleteMedicineErrorImplCopyWith(
    _$DeleteMedicineErrorImpl value,
    $Res Function(_$DeleteMedicineErrorImpl) then,
  ) = __$$DeleteMedicineErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$DeleteMedicineErrorImplCopyWithImpl<$Res>
    extends _$MedicineStateCopyWithImpl<$Res, _$DeleteMedicineErrorImpl>
    implements _$$DeleteMedicineErrorImplCopyWith<$Res> {
  __$$DeleteMedicineErrorImplCopyWithImpl(
    _$DeleteMedicineErrorImpl _value,
    $Res Function(_$DeleteMedicineErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? apiErrorModel = null}) {
    return _then(
      _$DeleteMedicineErrorImpl(
        null == apiErrorModel
            ? _value.apiErrorModel
            : apiErrorModel // ignore: cast_nullable_to_non_nullable
                  as ApiErrorModel,
      ),
    );
  }
}

/// @nodoc

class _$DeleteMedicineErrorImpl implements DeleteMedicineError {
  const _$DeleteMedicineErrorImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'MedicineState.deleteMedicineError(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMedicineErrorImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMedicineErrorImplCopyWith<_$DeleteMedicineErrorImpl> get copyWith =>
      __$$DeleteMedicineErrorImplCopyWithImpl<_$DeleteMedicineErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MedicineResponseBody> medicines) success,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function() addMedicineLoading,
    required TResult Function() addMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) addMedicineError,
    required TResult Function() deleteMedicineLoading,
    required TResult Function() deleteMedicineSuccess,
    required TResult Function(ApiErrorModel apiErrorModel) deleteMedicineError,
  }) {
    return deleteMedicineError(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MedicineResponseBody> medicines)? success,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function()? addMedicineLoading,
    TResult? Function()? addMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult? Function()? deleteMedicineLoading,
    TResult? Function()? deleteMedicineSuccess,
    TResult? Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
  }) {
    return deleteMedicineError?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MedicineResponseBody> medicines)? success,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function()? addMedicineLoading,
    TResult Function()? addMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? addMedicineError,
    TResult Function()? deleteMedicineLoading,
    TResult Function()? deleteMedicineSuccess,
    TResult Function(ApiErrorModel apiErrorModel)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (deleteMedicineError != null) {
      return deleteMedicineError(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(MedicineLoading value) loading,
    required TResult Function(MedicineSuccess value) success,
    required TResult Function(MedicineError value) error,
    required TResult Function(AddMedicineLoading value) addMedicineLoading,
    required TResult Function(AddMedicineSuccess value) addMedicineSuccess,
    required TResult Function(AddMedicineError value) addMedicineError,
    required TResult Function(DeleteMedicineLoading value)
    deleteMedicineLoading,
    required TResult Function(DeleteMedicineSuccess value)
    deleteMedicineSuccess,
    required TResult Function(DeleteMedicineError value) deleteMedicineError,
  }) {
    return deleteMedicineError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(MedicineLoading value)? loading,
    TResult? Function(MedicineSuccess value)? success,
    TResult? Function(MedicineError value)? error,
    TResult? Function(AddMedicineLoading value)? addMedicineLoading,
    TResult? Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult? Function(AddMedicineError value)? addMedicineError,
    TResult? Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult? Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult? Function(DeleteMedicineError value)? deleteMedicineError,
  }) {
    return deleteMedicineError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(MedicineLoading value)? loading,
    TResult Function(MedicineSuccess value)? success,
    TResult Function(MedicineError value)? error,
    TResult Function(AddMedicineLoading value)? addMedicineLoading,
    TResult Function(AddMedicineSuccess value)? addMedicineSuccess,
    TResult Function(AddMedicineError value)? addMedicineError,
    TResult Function(DeleteMedicineLoading value)? deleteMedicineLoading,
    TResult Function(DeleteMedicineSuccess value)? deleteMedicineSuccess,
    TResult Function(DeleteMedicineError value)? deleteMedicineError,
    required TResult orElse(),
  }) {
    if (deleteMedicineError != null) {
      return deleteMedicineError(this);
    }
    return orElse();
  }
}

abstract class DeleteMedicineError implements MedicineState {
  const factory DeleteMedicineError(final ApiErrorModel apiErrorModel) =
      _$DeleteMedicineErrorImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of MedicineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteMedicineErrorImplCopyWith<_$DeleteMedicineErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
