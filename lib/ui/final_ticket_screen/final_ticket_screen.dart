import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';
import 'package:movie_booking_app/ui/final_ticket_screen/final_ticket_view_model.dart';
import 'package:movie_booking_app/ui/final_ticket_screen/widgets/ticket_view.dart';

class FinalTicketScreen extends ConsumerStatefulWidget {
  const FinalTicketScreen({required this.reservations, super.key});
  final List<Reservation> reservations;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FinalTicketScreenState();
}

class _FinalTicketScreenState extends ConsumerState<FinalTicketScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(finalTicketViewModelProvider.notifier).saveTicketsToDatabase(widget.reservations);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Reservation"),
        backgroundColor: const Color(0xFF2F2C44),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: TicketView(reservation: widget.reservations[index]),
            )),
        itemCount: widget.reservations.length,
      ),
    );
  }
}
