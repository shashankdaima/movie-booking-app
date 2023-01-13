// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeViewModelState {
  HomeScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<ThumbnailResponse> get thumbnailList =>
      throw _privateConstructorUsedError;
  int get carouselIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewModelStateCopyWith<HomeViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewModelStateCopyWith<$Res> {
  factory $HomeViewModelStateCopyWith(
          HomeViewModelState value, $Res Function(HomeViewModelState) then) =
      _$HomeViewModelStateCopyWithImpl<$Res, HomeViewModelState>;
  @useResult
  $Res call(
      {HomeScreenStatus status,
      String? errorMessage,
      List<ThumbnailResponse> thumbnailList,
      int carouselIndex});
}

/// @nodoc
class _$HomeViewModelStateCopyWithImpl<$Res, $Val extends HomeViewModelState>
    implements $HomeViewModelStateCopyWith<$Res> {
  _$HomeViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? thumbnailList = null,
    Object? carouselIndex = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailList: null == thumbnailList
          ? _value.thumbnailList
          : thumbnailList // ignore: cast_nullable_to_non_nullable
              as List<ThumbnailResponse>,
      carouselIndex: null == carouselIndex
          ? _value.carouselIndex
          : carouselIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeViewModelStateCopyWith<$Res>
    implements $HomeViewModelStateCopyWith<$Res> {
  factory _$$_HomeViewModelStateCopyWith(_$_HomeViewModelState value,
          $Res Function(_$_HomeViewModelState) then) =
      __$$_HomeViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeScreenStatus status,
      String? errorMessage,
      List<ThumbnailResponse> thumbnailList,
      int carouselIndex});
}

/// @nodoc
class __$$_HomeViewModelStateCopyWithImpl<$Res>
    extends _$HomeViewModelStateCopyWithImpl<$Res, _$_HomeViewModelState>
    implements _$$_HomeViewModelStateCopyWith<$Res> {
  __$$_HomeViewModelStateCopyWithImpl(
      _$_HomeViewModelState _value, $Res Function(_$_HomeViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? thumbnailList = null,
    Object? carouselIndex = null,
  }) {
    return _then(_$_HomeViewModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailList: null == thumbnailList
          ? _value._thumbnailList
          : thumbnailList // ignore: cast_nullable_to_non_nullable
              as List<ThumbnailResponse>,
      carouselIndex: null == carouselIndex
          ? _value.carouselIndex
          : carouselIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeViewModelState implements _HomeViewModelState {
  const _$_HomeViewModelState(
      {this.status = HomeScreenStatus.initial,
      this.errorMessage,
      final List<ThumbnailResponse> thumbnailList = const [],
      this.carouselIndex = 0})
      : _thumbnailList = thumbnailList;

  @override
  @JsonKey()
  final HomeScreenStatus status;
  @override
  final String? errorMessage;
  final List<ThumbnailResponse> _thumbnailList;
  @override
  @JsonKey()
  List<ThumbnailResponse> get thumbnailList {
    if (_thumbnailList is EqualUnmodifiableListView) return _thumbnailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnailList);
  }

  @override
  @JsonKey()
  final int carouselIndex;

  @override
  String toString() {
    return 'HomeViewModelState(status: $status, errorMessage: $errorMessage, thumbnailList: $thumbnailList, carouselIndex: $carouselIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._thumbnailList, _thumbnailList) &&
            (identical(other.carouselIndex, carouselIndex) ||
                other.carouselIndex == carouselIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      const DeepCollectionEquality().hash(_thumbnailList), carouselIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeViewModelStateCopyWith<_$_HomeViewModelState> get copyWith =>
      __$$_HomeViewModelStateCopyWithImpl<_$_HomeViewModelState>(
          this, _$identity);
}

abstract class _HomeViewModelState implements HomeViewModelState {
  const factory _HomeViewModelState(
      {final HomeScreenStatus status,
      final String? errorMessage,
      final List<ThumbnailResponse> thumbnailList,
      final int carouselIndex}) = _$_HomeViewModelState;

  @override
  HomeScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  List<ThumbnailResponse> get thumbnailList;
  @override
  int get carouselIndex;
  @override
  @JsonKey(ignore: true)
  _$$_HomeViewModelStateCopyWith<_$_HomeViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
