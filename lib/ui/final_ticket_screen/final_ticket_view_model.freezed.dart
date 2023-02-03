// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'final_ticket_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FinalTicketViewModelState {
  FinalTicketScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FinalTicketViewModelStateCopyWith<FinalTicketViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinalTicketViewModelStateCopyWith<$Res> {
  factory $FinalTicketViewModelStateCopyWith(FinalTicketViewModelState value,
          $Res Function(FinalTicketViewModelState) then) =
      _$FinalTicketViewModelStateCopyWithImpl<$Res, FinalTicketViewModelState>;
  @useResult
  $Res call({FinalTicketScreenStatus status, String? errorMessage});
}

/// @nodoc
class _$FinalTicketViewModelStateCopyWithImpl<$Res,
        $Val extends FinalTicketViewModelState>
    implements $FinalTicketViewModelStateCopyWith<$Res> {
  _$FinalTicketViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FinalTicketScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FinalTicketViewModelStateCopyWith<$Res>
    implements $FinalTicketViewModelStateCopyWith<$Res> {
  factory _$$_FinalTicketViewModelStateCopyWith(
          _$_FinalTicketViewModelState value,
          $Res Function(_$_FinalTicketViewModelState) then) =
      __$$_FinalTicketViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FinalTicketScreenStatus status, String? errorMessage});
}

/// @nodoc
class __$$_FinalTicketViewModelStateCopyWithImpl<$Res>
    extends _$FinalTicketViewModelStateCopyWithImpl<$Res,
        _$_FinalTicketViewModelState>
    implements _$$_FinalTicketViewModelStateCopyWith<$Res> {
  __$$_FinalTicketViewModelStateCopyWithImpl(
      _$_FinalTicketViewModelState _value,
      $Res Function(_$_FinalTicketViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_FinalTicketViewModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FinalTicketScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FinalTicketViewModelState implements _FinalTicketViewModelState {
  const _$_FinalTicketViewModelState(
      {this.status = FinalTicketScreenStatus.initial, this.errorMessage});

  @override
  @JsonKey()
  final FinalTicketScreenStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FinalTicketViewModelState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FinalTicketViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinalTicketViewModelStateCopyWith<_$_FinalTicketViewModelState>
      get copyWith => __$$_FinalTicketViewModelStateCopyWithImpl<
          _$_FinalTicketViewModelState>(this, _$identity);
}

abstract class _FinalTicketViewModelState implements FinalTicketViewModelState {
  const factory _FinalTicketViewModelState(
      {final FinalTicketScreenStatus status,
      final String? errorMessage}) = _$_FinalTicketViewModelState;

  @override
  FinalTicketScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_FinalTicketViewModelStateCopyWith<_$_FinalTicketViewModelState>
      get copyWith => throw _privateConstructorUsedError;
}
