// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchViewModelState {
  SearchScreenStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get q => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  dynamic get hasMore => throw _privateConstructorUsedError;
  List<SearchResultItem> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchViewModelStateCopyWith<SearchViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewModelStateCopyWith<$Res> {
  factory $SearchViewModelStateCopyWith(SearchViewModelState value,
          $Res Function(SearchViewModelState) then) =
      _$SearchViewModelStateCopyWithImpl<$Res, SearchViewModelState>;
  @useResult
  $Res call(
      {SearchScreenStatus status,
      String? errorMessage,
      String? q,
      int page,
      dynamic hasMore,
      List<SearchResultItem> list});
}

/// @nodoc
class _$SearchViewModelStateCopyWithImpl<$Res,
        $Val extends SearchViewModelState>
    implements $SearchViewModelStateCopyWith<$Res> {
  _$SearchViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? q = freezed,
    Object? page = null,
    Object? hasMore = freezed,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as dynamic,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SearchResultItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchViewModelStateCopyWith<$Res>
    implements $SearchViewModelStateCopyWith<$Res> {
  factory _$$_SearchViewModelStateCopyWith(_$_SearchViewModelState value,
          $Res Function(_$_SearchViewModelState) then) =
      __$$_SearchViewModelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SearchScreenStatus status,
      String? errorMessage,
      String? q,
      int page,
      dynamic hasMore,
      List<SearchResultItem> list});
}

/// @nodoc
class __$$_SearchViewModelStateCopyWithImpl<$Res>
    extends _$SearchViewModelStateCopyWithImpl<$Res, _$_SearchViewModelState>
    implements _$$_SearchViewModelStateCopyWith<$Res> {
  __$$_SearchViewModelStateCopyWithImpl(_$_SearchViewModelState _value,
      $Res Function(_$_SearchViewModelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? q = freezed,
    Object? page = null,
    Object? hasMore = freezed,
    Object? list = null,
  }) {
    return _then(_$_SearchViewModelState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchScreenStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      q: freezed == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: freezed == hasMore ? _value.hasMore! : hasMore,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SearchResultItem>,
    ));
  }
}

/// @nodoc

class _$_SearchViewModelState implements _SearchViewModelState {
  const _$_SearchViewModelState(
      {this.status = SearchScreenStatus.initial,
      this.errorMessage,
      this.q,
      this.page = 1,
      this.hasMore = true,
      final List<SearchResultItem> list = const []})
      : _list = list;

  @override
  @JsonKey()
  final SearchScreenStatus status;
  @override
  final String? errorMessage;
  @override
  final String? q;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final dynamic hasMore;
  final List<SearchResultItem> _list;
  @override
  @JsonKey()
  List<SearchResultItem> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'SearchViewModelState(status: $status, errorMessage: $errorMessage, q: $q, page: $page, hasMore: $hasMore, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchViewModelState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMessage,
      q,
      page,
      const DeepCollectionEquality().hash(hasMore),
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchViewModelStateCopyWith<_$_SearchViewModelState> get copyWith =>
      __$$_SearchViewModelStateCopyWithImpl<_$_SearchViewModelState>(
          this, _$identity);
}

abstract class _SearchViewModelState implements SearchViewModelState {
  const factory _SearchViewModelState(
      {final SearchScreenStatus status,
      final String? errorMessage,
      final String? q,
      final int page,
      final dynamic hasMore,
      final List<SearchResultItem> list}) = _$_SearchViewModelState;

  @override
  SearchScreenStatus get status;
  @override
  String? get errorMessage;
  @override
  String? get q;
  @override
  int get page;
  @override
  dynamic get hasMore;
  @override
  List<SearchResultItem> get list;
  @override
  @JsonKey(ignore: true)
  _$$_SearchViewModelStateCopyWith<_$_SearchViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
