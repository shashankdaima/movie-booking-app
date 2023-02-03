import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';

import '../../../services/database/app_database.dart';
part 'history_view_model.freezed.dart';

final historyViewModelProvider =
    StateNotifierProvider<HistoryViewModel, HistoryViewModelState>(((ref) =>
        HistoryViewModel(ref: ref, database: ref.read(appDatabaseProvider))));

class HistoryViewModel extends StateNotifier<HistoryViewModelState> {
  final Future<AppDatabase> database;
  final StateNotifierProviderRef ref;
  late StreamSubscription databaseSubscription;

  HistoryViewModel({required this.database, required this.ref})
      : super(const HistoryViewModelState()) {
    loadValues();
  }
  loadValues() async {
    // debugPrint((await(await database).reservationDao.getAllReservations()).length.toString());
    final listOfReservation =
        (await database).reservationDao.getAllReservations();
    
    databaseSubscription = listOfReservation.listen((reservations) {
      debugPrint(reservations.length.toString());
      state = state.copyWith(reservation: reservations);
    });
  }

  @override
  void dispose() {
    databaseSubscription.cancel();
    super.dispose();
  }
}

@freezed
class HistoryViewModelState with _$HistoryViewModelState {
  const factory HistoryViewModelState(
      {@Default(HistoryScreenStatus.initial) HistoryScreenStatus status,
      String? errorMessage,
      @Default([]) List<Reservation> reservation}) = _HistoryViewModelState;
}

enum HistoryScreenStatus { initial, loading, error, loaded }
