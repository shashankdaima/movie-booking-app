import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_booking_app/models/responses/movie_details.dart';
import 'package:movie_booking_app/services/supabase/supabase_client.dart';
import 'package:movie_booking_app/utils/api_response.dart';
import 'package:movie_booking_app/utils/api_response.dart';

import '../../models/responses/movie.dart';
import '../../models/responses/thumbnail_response.dart';
import '../../services/api_services/api_service.dart';
import '../../utils/api_response.dart';
part 'seat_selection_view_model.freezed.dart';

final seatSelectionViewModelProvider = StateNotifierProvider.autoDispose<
        SeatSelectionViewModel, SeatSelectionViewModelState>(
    ((ref) => SeatSelectionViewModel(
        ref: ref, apiService: ref.read(apiServiceProvider))));

class SeatSelectionViewModel
    extends StateNotifier<SeatSelectionViewModelState> {
  final ApiService apiService;
  final StateNotifierProviderRef ref;
  late StreamSubscription rtEventSubscription;
  SeatSelectionViewModel({required this.apiService, required this.ref})
      : super(const SeatSelectionViewModelState()) {
    _loadSeatSelectionScreen("299534");
    setDate(DateTime.now());
  }
  _loadSeatSelectionScreen(String id) async {
    rtEventSubscription = SupabaseClient.supabaseInstance
        .from("schedule")
        .stream(primaryKey: ['pid'])
        .eq('id', id)
        .listen((event) {
          state = state.copyWith(seatingArrangement: event);
        });
  }

  @override
  void dispose() {
    rtEventSubscription.cancel();
    super.dispose();
  }

  // void makePayment(){
  //   final seatingArrangment=state.seatingArrangement;
  //   state.selectedSeats.forEach((element) {

  //   });
  //   SupabaseClient.bookTicket();
  // }
  void bookSeat(int index) {
    int? i = null;
    int rangeOfSchedules = (state.seatingArrangement == null)
        ? 0
        : (state.seatingArrangement as List).length;
    for (int j = 0; j < rangeOfSchedules; j++) {
      if (compareDate(state.seatingArrangement[j]["created_on"].toString(),
          state.currentDate.toString())) {
        i = j;
        break;
      }
    }
    if (state.seatingArrangement == null ||
        state.seatingArrangement[i]["s${index}"].toString() == "null") {
      final currentList = state.selectedSeats.toList();
      if (currentList.contains("s$index")) {
        currentList.removeWhere((element) => element == "s$index");
      } else
        currentList.add("s$index");
      state = state.copyWith(selectedSeats: currentList);
    }
  }

  void setDate(DateTime obj) {
    //
    state = state.copyWith(currentDate: obj.toString().substring(0, 11));
  }

  bool compareDate(String a, String b) {
    int aYear = int.parse(a.substring(0, 4));
    int aMonth = int.parse(a.substring(5, 7));
    int aDate = int.parse(a.substring(8, 10));
    int bYear = int.parse(b.substring(0, 4));
    int bMonth = int.parse(b.substring(5, 7));
    int bDate = int.parse(b.substring(8, 10));

    return aYear == bYear && aMonth == bMonth && aDate == bDate;
  }

  setSeattingArrangementIndex(int index) {
    state = state.copyWith(seatingArrangementIndex: index);
  }

  int? getSeatingArrangmentIndex() {
    return state.seatingArrangementIndex;
  }
}

@freezed
class SeatSelectionViewModelState with _$SeatSelectionViewModelState {
  const factory SeatSelectionViewModelState(
      {@Default(SeatSelectionScreenStatus.initial)
          SeatSelectionScreenStatus status,
      String? errorMessage,
      dynamic? seatingArrangement,
      String? currentDate,
      int? seatingArrangementIndex,
      @Default([])
          List<String> selectedSeats}) = _SeatSelectionViewModelState;
}

enum SeatSelectionScreenStatus { initial, loading, error, loaded }
