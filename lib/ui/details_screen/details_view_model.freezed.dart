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
  Movie? get movie => throw _privateConstructorUsedError;
  MovieDetails? get details => throw _privateConstructorUsedError;

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
      Movie? movie,
      MovieDetails? details});
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
    Object? movie = freezed,
    Object? details = freezed,
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
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
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
      Movie? movie,
      MovieDetails? details});
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
    Object? movie = freezed,
    Object? details = freezed,
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
      movie: freezed == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as MovieDetails?,
    ));
  }
}

/// @nodoc

class _$_DetailsViewModelState implements _DetailsViewModelState {
  const _$_DetailsViewModelState(
      {this.status = DetailsScreenStatus.initial,
      this.errorMessage,
      this.movie,
      this.details});

  @override
  @JsonKey()
  final DetailsScreenStatus status;
  @override
  final String? errorMessage;
  @override
  final Movie? movie;
  @override
  final MovieDetails? details;

  @override
  String toString() {
    return 'DetailsViewModelState(status: $status, errorMessage: $errorMessage, movie: $movie, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorMessage, movie, details);

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
      final Movie? movie,
      final MovieDetails? details}) = _$_DetailsViewModelState;

  @override
  DetailsScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  Movie? get movie;
  @override
  MovieDetails? get details;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsViewModelStateCopyWith<_$_DetailsViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
