import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:movie_booking_app/utils/api_response.dart';

import '../../../models/responses/search_results.dart';
import '../../../services/api_services/api_service.dart';

part 'search_view_model.freezed.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchViewModelState>(((ref) =>
        SearchViewModel(ref: ref, apiService: ref.read(apiServiceProvider))));

class SearchViewModel extends StateNotifier<SearchViewModelState> {
  final ApiService apiService;
  final StateNotifierProviderRef ref;
  SearchViewModel({required this.apiService, required this.ref})
      : super(const SearchViewModelState()) {
    // _loadHomeScreen();
  }
  searchQuery({String? str}) async {
    final q = str ?? state.q;
    if (q!.isNotEmpty && state.status != SearchScreenStatus.loading) {
      if (str == null) {
        state = state.copyWith(
            status: SearchScreenStatus.loading, page: state.page + 1);
      } else {
        state = state.copyWith(
            q: q, status: SearchScreenStatus.loading, page: 1, list: []);
      }
      final response = await apiService.searchShow(q, state.page);
      // debugPrint(response.errorMessage);
      if (response.status != ApiStatus.success) {
        state = state.copyWith(
          status: SearchScreenStatus.error,
          errorMessage: response.errorMessage,
        );
      } else {
        print(response.data!.totalPages != response.data!.page);
        if (str == null) {
          state = state.copyWith(
              list: [...state.list, ...response.data!.results],
              status: SearchScreenStatus.loaded,
              hasMore: response.data!.totalPages != response.data!.page);
        } else {
          state = state.copyWith(
              list: response.data!.results,
              status: SearchScreenStatus.loaded,
              hasMore: response.data!.totalPages != response.data!.page);
        }
        // debugPrint(state.list.length.toString());
      }
    }
  }
}

@freezed
class SearchViewModelState with _$SearchViewModelState {
  const factory SearchViewModelState(
      {@Default(SearchScreenStatus.initial) SearchScreenStatus status,
      String? errorMessage,
      String? q,
      @Default(1) int page,
      @Default(true) hasMore,
      @Default([]) List<SearchResultItem> list}) = _SearchViewModelState;
}

enum SearchScreenStatus { initial, loading, error, loaded }
