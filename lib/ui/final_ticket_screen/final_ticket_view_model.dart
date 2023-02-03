import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';

import '../../services/database/app_database.dart';
part 'final_ticket_view_model.freezed.dart';

final finalTicketViewModelProvider = StateNotifierProvider.autoDispose<
        FinalTicketViewModel, FinalTicketViewModelState>(
    ((ref) => FinalTicketViewModel(
        ref: ref, database: ref.read(appDatabaseProvider))));

class FinalTicketViewModel extends StateNotifier<FinalTicketViewModelState> {
  final Future<AppDatabase> database;
  final StateNotifierProviderRef ref;
  FinalTicketViewModel({required this.database, required this.ref})
      : super(const FinalTicketViewModelState()) {}

  void saveTicketsToDatabase(List<Reservation> reservations) async {
    final reservationDao = (await database).reservationDao;
    for (Reservation i in reservations) {
      reservationDao.insertReservation(i);
    }
  }
}

@freezed
class FinalTicketViewModelState with _$FinalTicketViewModelState {
  const factory FinalTicketViewModelState({
    @Default(FinalTicketScreenStatus.initial) FinalTicketScreenStatus status,
    String? errorMessage,
  }) = _FinalTicketViewModelState;
}

enum FinalTicketScreenStatus { initial, loading, error, loaded }
