import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_booking_app/models/responses/movie_details.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:movie_booking_app/utils/api_response.dart';

import '../../models/responses/movie.dart';
import '../../models/responses/thumbnail_response.dart';
import '../../services/api_services/api_service.dart';
import '../../utils/api_response.dart';
part 'details_view_model.freezed.dart';

final detailsViewModelProvider =
    StateNotifierProvider.autoDispose<DetailsViewModel, DetailsViewModelState>(((ref) =>
        DetailsViewModel(ref: ref, apiService: ref.read(apiServiceProvider))));
// StateNotifierProvider<DetailsViewModel, DetailsViewModelState> getViewModel(
//     Movie movie) {
//   return StateNotifierProvider<DetailsViewModel, DetailsViewModelState>(
//       ((ref) => DetailsViewModel(
//           ref: ref, apiService: ref.read(apiServiceProvider))));
// }

class DetailsViewModel extends StateNotifier<DetailsViewModelState> {
  final ApiService apiService;
  final StateNotifierProviderRef ref;
  DetailsViewModel({required this.apiService, required this.ref})
      : super(const DetailsViewModelState()) {
    // _loadDetailsScreen();
  }
  loadDetailsScreen(Movie movie) async {
    state = state.copyWith(status: DetailsScreenStatus.loading, movie: movie);

    final response = await apiService.getMoviesById(movie.id.toString());
    // debugPrint(response.toString());
    if (response.status != ApiStatus.success) {
      if (response.status == ApiStatus.authError) {
        debugPrint("AUTH ERROR");
        state = state.copyWith(
          status: DetailsScreenStatus.error,
          errorMessage: "User Not Authenticated",
        );
        return;
      }
      debugPrint(response.toString());
      state = state.copyWith(
        status: DetailsScreenStatus.error,
        errorMessage: response.errorMessage,
      );
    } else {
      debugPrint(response.data.toString());
      state = state.copyWith(
          status: DetailsScreenStatus.loaded, details: response.data);
    }
  }
}

@freezed
class DetailsViewModelState with _$DetailsViewModelState {
  const factory DetailsViewModelState(
      {@Default(DetailsScreenStatus.initial) DetailsScreenStatus status,
      String? errorMessage,
      Movie? movie,
      MovieDetails? details}) = _DetailsViewModelState;
}

enum DetailsScreenStatus { initial, loading, error, loaded }
