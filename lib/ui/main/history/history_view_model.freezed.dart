// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryViewModelState {
  HistoryScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<Reservation> get reservation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryViewModelStateCopyWith<HistoryViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryViewModelStateCopyWith<$Res> {
  factory $HistoryViewModelStateCopyWith(HistoryViewModelState value,
          $Res Function(HistoryViewModelState) then) =
      _$HistoryViewModelStateCopyWithImpl<$Res, HistoryViewModelState>;
  @useResult
  $Res call(
      {HistoryScreenStatus status,
      String? errorMessage,
      List<Reservation> reservation});
}

/// @nodoc
class _$HistoryViewModelStateCopyWithImpl<$Res,
        $Val extends HistoryViewModelState>
    implements $HistoryViewModelStateCopyWith<$Res> {
  _$HistoryViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? reservation = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HistoryScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      reservation: null == reservation
          ? _value.reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as List<Reservation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryViewModelStateCopyWith<$Res>
    implements $HistoryViewModelStateCopyWith<$Res> {
  factory _$$_HistoryViewModelStateCopyWith(_$_HistoryViewModelState value,
          $Res Function(_$_HistoryViewModelState) then) =
      __$$_HistoryViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HistoryScreenStatus status,
      String? errorMessage,
      List<Reservation> reservation});
}

/// @nodoc
class __$$_HistoryViewModelStateCopyWithImpl<$Res>
    extends _$HistoryViewModelStateCopyWithImpl<$Res, _$_HistoryViewModelState>
    implements _$$_HistoryViewModelStateCopyWith<$Res> {
  __$$_HistoryViewModelStateCopyWithImpl(_$_HistoryViewModelState _value,
      $Res Function(_$_HistoryViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? reservation = null,
  }) {
    return _then(_$_HistoryViewModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HistoryScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      reservation: null == reservation
          ? _value._reservation
          : reservation // ignore: cast_nullable_to_non_nullable
              as List<Reservation>,
    ));
  }
}

/// @nodoc

class _$_HistoryViewModelState implements _HistoryViewModelState {
  const _$_HistoryViewModelState(
      {this.status = HistoryScreenStatus.initial,
      this.errorMessage,
      final List<Reservation> reservation = const []})
      : _reservation = reservation;

  @override
  @JsonKey()
  final HistoryScreenStatus status;
  @override
  final String? errorMessage;
  final List<Reservation> _reservation;
  @override
  @JsonKey()
  List<Reservation> get reservation {
    if (_reservation is EqualUnmodifiableListView) return _reservation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservation);
  }

  @override
  String toString() {
    return 'HistoryViewModelState(status: $status, errorMessage: $errorMessage, reservation: $reservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._reservation, _reservation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_reservation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryViewModelStateCopyWith<_$_HistoryViewModelState> get copyWith =>
      __$$_HistoryViewModelStateCopyWithImpl<_$_HistoryViewModelState>(
          this, _$identity);
}

abstract class _HistoryViewModelState implements HistoryViewModelState {
  const factory _HistoryViewModelState(
      {final HistoryScreenStatus status,
      final String? errorMessage,
      final List<Reservation> reservation}) = _$_HistoryViewModelState;

  @override
  HistoryScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  List<Reservation> get reservation;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryViewModelStateCopyWith<_$_HistoryViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
