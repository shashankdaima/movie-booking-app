import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_app/ui/final_ticket_screen/widgets/ticket_view.dart';

class FinalTicketScreen extends ConsumerWidget {
  const FinalTicketScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Reservation"),
        backgroundColor: const Color(0xFF2F2C44),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TicketView(),
            )),
        itemCount: 10,
      ),
    );
  }
}
