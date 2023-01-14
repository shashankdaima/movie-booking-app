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
part 'seat_selection_view_model.freezed.dart';

final seatSelectionViewModelProvider =
    StateNotifierProvider<SeatSelectionViewModel, SeatSelectionViewModelState>(((ref) =>
        SeatSelectionViewModel(ref: ref, apiService: ref.read(apiServiceProvider))));

class SeatSelectionViewModel extends StateNotifier<SeatSelectionViewModelState> {
  final ApiService apiService;
  final StateNotifierProviderRef ref;
  SeatSelectionViewModel({required this.apiService, required this.ref})
      : super(const SeatSelectionViewModelState()) {
    _loadSeatSelectionScreen();
  }
  _loadSeatSelectionScreen() async {
  }
}

@freezed
class SeatSelectionViewModelState with _$SeatSelectionViewModelState {
  const factory SeatSelectionViewModelState({
    @Default(SeatSelectionScreenStatus.initial) SeatSelectionScreenStatus status,
    String? errorMessage,
  }) = _SeatSelectionViewModelState;
}

enum SeatSelectionScreenStatus { initial, loading, error, loaded }
