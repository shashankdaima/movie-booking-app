import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:movie_booking_app/utils/api_response.dart';

import '../../models/responses/movie.dart';
import '../../models/responses/thumbnail_response.dart';
import '../../services/api_services/api_service.dart';
import '../../utils/api_response.dart';
part 'home_view_model.freezed.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeViewModelState>(((ref) =>
        HomeViewModel(ref: ref, apiService: ref.read(apiServiceProvider))));

class HomeViewModel extends StateNotifier<HomeViewModelState> {
  final ApiService apiService;
  final StateNotifierProviderRef ref;
  HomeViewModel({required this.apiService, required this.ref})
      : super(const HomeViewModelState()) {
    _loadHomeScreen();
  }
  _loadHomeScreen() async {
    final thumbnailResponse = await _loadThumbnails();
    debugPrint(thumbnailResponse.toString());
    final moviesResponse = await _loadMovies();
    if (thumbnailResponse && moviesResponse) {
      state = state.copyWith(carouselIndex: 0, status: HomeScreenStatus.loaded);
    }
  }

  Future<bool> _loadThumbnails() async {
    state = state.copyWith(status: HomeScreenStatus.loading);
    final response = await apiService.getThumbnails();
    if (response.status != ApiStatus.success) {
      if (response.status == ApiStatus.authError) {
        state = state.copyWith(
          status: HomeScreenStatus.error,
          errorMessage: "User Not Authenticated",
        );
        return false;
      }
      state = state.copyWith(
        status: HomeScreenStatus.error,
        errorMessage: response.errorMessage,
      );
      return false;
    } else {
      state = state.copyWith(carouselIndex: 0, thumbnailList: response.data!);
      return true;
    }
  }

  Future<bool> _loadMovies() async {
    final response = await apiService.getTrendingMovies();
    // debugPrint(.toString());
    if (response.status != ApiStatus.success) {
      state = state.copyWith(
          status: HomeScreenStatus.error, errorMessage: response.errorMessage);
      return false;
    } else {
      state = state.copyWith(movies: response.data!.results!);
      return true;
    }
  }

  void changeCarouselIndex(int i) {
    state = state.copyWith(carouselIndex: i);
  }
}

@freezed
class HomeViewModelState with _$HomeViewModelState {
  const factory HomeViewModelState({
    @Default(HomeScreenStatus.initial) HomeScreenStatus status,
    String? errorMessage,
    @Default([]) List<ThumbnailResponse> thumbnailList,
    @Default(0) int carouselIndex,
    @Default([]) List<Movie> movies,
  }) = _HomeViewModelState;
}

enum HomeScreenStatus { initial, loading, error, loaded }
