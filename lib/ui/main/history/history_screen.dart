import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';

import '../../final_ticket_screen/widgets/ticket_view.dart';
import 'history_view_model.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref
        .watch(historyViewModelProvider.select((value) => value.reservation));
    return (list.isNotEmpty)
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TicketView(
                    reservation: Reservation(
                        name: list[index].name,
                        email: list[index].email,
                        startingDate: list[index].startingDate,
                        seatNo: list[index].seatNo,
                        movieId: list[index].movieId,
                        movieSlotId: list[index].movieSlotId),
                  ),
                )),
            itemCount: list.length,
          )
        : Center(
            child: Column(
              children: [
                const Icon(Icons.history),
                const Text("No History to show!")
              ],
            ),
          );
  }
}
