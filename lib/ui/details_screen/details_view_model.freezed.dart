// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsViewModelState {
  DetailsScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  MovieDetails? get detailsModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsViewModelStateCopyWith<DetailsViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsViewModelStateCopyWith<$Res> {
  factory $DetailsViewModelStateCopyWith(DetailsViewModelState value,
          $Res Function(DetailsViewModelState) then) =
      _$DetailsViewModelStateCopyWithImpl<$Res, DetailsViewModelState>;
  @useResult
  $Res call(
      {DetailsScreenStatus status,
      String? errorMessage,
      MovieDetails? detailsModel});
}

/// @nodoc
class _$DetailsViewModelStateCopyWithImpl<$Res,
        $Val extends DetailsViewModelState>
    implements $DetailsViewModelStateCopyWith<$Res> {
  _$DetailsViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? detailsModel = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailsScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      detailsModel: freezed == detailsModel
          ? _value.detailsModel
          : detailsModel // ignore: cast_nullable_to_non_nullable
              as MovieDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsViewModelStateCopyWith<$Res>
    implements $DetailsViewModelStateCopyWith<$Res> {
  factory _$$_DetailsViewModelStateCopyWith(_$_DetailsViewModelState value,
          $Res Function(_$_DetailsViewModelState) then) =
      __$$_DetailsViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetailsScreenStatus status,
      String? errorMessage,
      MovieDetails? detailsModel});
}

/// @nodoc
class __$$_DetailsViewModelStateCopyWithImpl<$Res>
    extends _$DetailsViewModelStateCopyWithImpl<$Res, _$_DetailsViewModelState>
    implements _$$_DetailsViewModelStateCopyWith<$Res> {
  __$$_DetailsViewModelStateCopyWithImpl(_$_DetailsViewModelState _value,
      $Res Function(_$_DetailsViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? detailsModel = freezed,
  }) {
    return _then(_$_DetailsViewModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailsScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      detailsModel: freezed == detailsModel
          ? _value.detailsModel
          : detailsModel // ignore: cast_nullable_to_non_nullable
              as MovieDetails?,
    ));
  }
}

/// @nodoc

class _$_DetailsViewModelState implements _DetailsViewModelState {
  const _$_DetailsViewModelState(
      {this.status = DetailsScreenStatus.initial,
      this.errorMessage,
      this.detailsModel});

  @override
  @JsonKey()
  final DetailsScreenStatus status;
  @override
  final String? errorMessage;
  @override
  final MovieDetails? detailsModel;

  @override
  String toString() {
    return 'DetailsViewModelState(status: $status, errorMessage: $errorMessage, detailsModel: $detailsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.detailsModel, detailsModel) ||
                other.detailsModel == detailsModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, detailsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsViewModelStateCopyWith<_$_DetailsViewModelState> get copyWith =>
      __$$_DetailsViewModelStateCopyWithImpl<_$_DetailsViewModelState>(
          this, _$identity);
}

abstract class _DetailsViewModelState implements DetailsViewModelState {
  const factory _DetailsViewModelState(
      {final DetailsScreenStatus status,
      final String? errorMessage,
      final MovieDetails? detailsModel}) = _$_DetailsViewModelState;

  @override
  DetailsScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  MovieDetails? get detailsModel;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsViewModelStateCopyWith<_$_DetailsViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
