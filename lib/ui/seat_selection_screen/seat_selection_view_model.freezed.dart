// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat_selection_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SeatSelectionViewModelState {
  SeatSelectionScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  dynamic? get seatingArrangement => throw _privateConstructorUsedError;
  String? get currentDate => throw _privateConstructorUsedError;
  int? get seatingArrangementIndex => throw _privateConstructorUsedError;
  List<String> get selectedSeats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeatSelectionViewModelStateCopyWith<SeatSelectionViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatSelectionViewModelStateCopyWith<$Res> {
  factory $SeatSelectionViewModelStateCopyWith(
          SeatSelectionViewModelState value,
          $Res Function(SeatSelectionViewModelState) then) =
      _$SeatSelectionViewModelStateCopyWithImpl<$Res,
          SeatSelectionViewModelState>;
  @useResult
  $Res call(
      {SeatSelectionScreenStatus status,
      String? errorMessage,
      dynamic? seatingArrangement,
      String? currentDate,
      int? seatingArrangementIndex,
      List<String> selectedSeats});
}

/// @nodoc
class _$SeatSelectionViewModelStateCopyWithImpl<$Res,
        $Val extends SeatSelectionViewModelState>
    implements $SeatSelectionViewModelStateCopyWith<$Res> {
  _$SeatSelectionViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? seatingArrangement = freezed,
    Object? currentDate = freezed,
    Object? seatingArrangementIndex = freezed,
    Object? selectedSeats = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SeatSelectionScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      seatingArrangement: freezed == seatingArrangement
          ? _value.seatingArrangement
          : seatingArrangement // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      currentDate: freezed == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      seatingArrangementIndex: freezed == seatingArrangementIndex
          ? _value.seatingArrangementIndex
          : seatingArrangementIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedSeats: null == selectedSeats
          ? _value.selectedSeats
          : selectedSeats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeatSelectionViewModelStateCopyWith<$Res>
    implements $SeatSelectionViewModelStateCopyWith<$Res> {
  factory _$$_SeatSelectionViewModelStateCopyWith(
          _$_SeatSelectionViewModelState value,
          $Res Function(_$_SeatSelectionViewModelState) then) =
      __$$_SeatSelectionViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SeatSelectionScreenStatus status,
      String? errorMessage,
      dynamic? seatingArrangement,
      String? currentDate,
      int? seatingArrangementIndex,
      List<String> selectedSeats});
}

/// @nodoc
class __$$_SeatSelectionViewModelStateCopyWithImpl<$Res>
    extends _$SeatSelectionViewModelStateCopyWithImpl<$Res,
        _$_SeatSelectionViewModelState>
    implements _$$_SeatSelectionViewModelStateCopyWith<$Res> {
  __$$_SeatSelectionViewModelStateCopyWithImpl(
      _$_SeatSelectionViewModelState _value,
      $Res Function(_$_SeatSelectionViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? seatingArrangement = freezed,
    Object? currentDate = freezed,
    Object? seatingArrangementIndex = freezed,
    Object? selectedSeats = null,
  }) {
    return _then(_$_SeatSelectionViewModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SeatSelectionScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      seatingArrangement: freezed == seatingArrangement
          ? _value.seatingArrangement
          : seatingArrangement // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      currentDate: freezed == currentDate
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      seatingArrangementIndex: freezed == seatingArrangementIndex
          ? _value.seatingArrangementIndex
          : seatingArrangementIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedSeats: null == selectedSeats
          ? _value._selectedSeats
          : selectedSeats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SeatSelectionViewModelState implements _SeatSelectionViewModelState {
  const _$_SeatSelectionViewModelState(
      {this.status = SeatSelectionScreenStatus.initial,
      this.errorMessage,
      this.seatingArrangement,
      this.currentDate,
      this.seatingArrangementIndex,
      final List<String> selectedSeats = const []})
      : _selectedSeats = selectedSeats;

  @override
  @JsonKey()
  final SeatSelectionScreenStatus status;
  @override
  final String? errorMessage;
  @override
  final dynamic? seatingArrangement;
  @override
  final String? currentDate;
  @override
  final int? seatingArrangementIndex;
  final List<String> _selectedSeats;
  @override
  @JsonKey()
  List<String> get selectedSeats {
    if (_selectedSeats is EqualUnmodifiableListView) return _selectedSeats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSeats);
  }

  @override
  String toString() {
    return 'SeatSelectionViewModelState(status: $status, errorMessage: $errorMessage, seatingArrangement: $seatingArrangement, currentDate: $currentDate, seatingArrangementIndex: $seatingArrangementIndex, selectedSeats: $selectedSeats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SeatSelectionViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.seatingArrangement, seatingArrangement) &&
            (identical(other.currentDate, currentDate) ||
                other.currentDate == currentDate) &&
            (identical(
                    other.seatingArrangementIndex, seatingArrangementIndex) ||
                other.seatingArrangementIndex == seatingArrangementIndex) &&
            const DeepCollectionEquality()
                .equals(other._selectedSeats, _selectedSeats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(seatingArrangement),
      currentDate,
      seatingArrangementIndex,
      const DeepCollectionEquality().hash(_selectedSeats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeatSelectionViewModelStateCopyWith<_$_SeatSelectionViewModelState>
      get copyWith => __$$_SeatSelectionViewModelStateCopyWithImpl<
          _$_SeatSelectionViewModelState>(this, _$identity);
}

abstract class _SeatSelectionViewModelState
    implements SeatSelectionViewModelState {
  const factory _SeatSelectionViewModelState(
      {final SeatSelectionScreenStatus status,
      final String? errorMessage,
      final dynamic? seatingArrangement,
      final String? currentDate,
      final int? seatingArrangementIndex,
      final List<String> selectedSeats}) = _$_SeatSelectionViewModelState;

  @override
  SeatSelectionScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  dynamic? get seatingArrangement;
  @override
  String? get currentDate;
  @override
  int? get seatingArrangementIndex;
  @override
  List<String> get selectedSeats;
  @override
  @JsonKey(ignore: true)
  _$$_SeatSelectionViewModelStateCopyWith<_$_SeatSelectionViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}
