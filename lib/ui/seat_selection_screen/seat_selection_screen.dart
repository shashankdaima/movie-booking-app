import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:movie_booking_app/core/router.gr.dart';
import 'package:movie_booking_app/ui/seat_selection_screen/seat_selection_view_model.dart';

import '../../models/responses/movie.dart';
import '../widgets/gradiant_button.dart';

class SeatSelectionScreen extends ConsumerStatefulWidget {
  const SeatSelectionScreen({required this.movie, super.key});
  final Movie movie;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends ConsumerState<SeatSelectionScreen> {
  DatePickerController _datePickerController = DatePickerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref
        .read(seatSelectionViewModelProvider.notifier)
        .loadSeatSelectionScreen(widget.movie.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref
        .watch(seatSelectionViewModelProvider.select((value) => value.status));
    final seatingArrangement = ref.watch(seatSelectionViewModelProvider
        .select((value) => value.seatingArrangement));
    // final requiredSeatingArrangement=(allSeatingArrangements as List).where((element) => false)
    final selectedSeats = ref.watch(
        seatSelectionViewModelProvider.select((value) => value.selectedSeats));
    final currentDate = ref.watch(
        seatSelectionViewModelProvider.select((value) => value.currentDate));
    var now = DateTime.now();
    DateTime startDate = now.subtract(Duration(days: 0));
    DateTime endDate = now.add(Duration(days: 7));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title.toString(),
        ),
        backgroundColor: const Color(0xFF2F2C44),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            HorizontalDatePickerWidget(
              startDate: startDate,
              endDate: endDate,
              normalColor: const Color(0xFF1C1A29),
              normalTextColor: Colors.white60,
              selectedColor: const Color(0xFF1C1A29),
              selectedDate: now,
              widgetWidth: MediaQuery.of(context).size.width,
              datePickerController: _datePickerController,
              disabledColor: const Color(0xFF1C1A29),
              disabledTextColor: Colors.white30,
              onValueSelected: (date) {
                // print('selected = ${date.toIso8601String()}');
                ref.read(seatSelectionViewModelProvider.notifier).setDate(date);
                // debugPrint((seatingArrangement as List).where((element) => element["created_on"].toString().contains(ref.watch(provider))))
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 450,
              child: GridView.custom(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (seatingArrangement == null) return;
                        ref
                            .read(seatSelectionViewModelProvider.notifier)
                            .bookSeat(index + 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: () {
                            int? i = null;
                            int rangeOfSchedules = (seatingArrangement == null)
                                ? 0
                                : (seatingArrangement as List).length;
                            for (int j = 0; j < rangeOfSchedules; j++) {
                              if (compareDate(
                                  seatingArrangement[j]["created_on"]
                                      .toString(),
                                  currentDate.toString())) {
                                i = j;
                                break;
                              }
                            }
                            return seatingArrangement == null ||
                                    i == null ||
                                    seatingArrangement[i]["s${index + 1}"]
                                            .toString() ==
                                        "null"
                                ? const Color(0xFF514F64)
                                : const Color(0xFF195777);
                          }(),
                          border: (selectedSeats.contains("s${index + 1}"))
                              ? Border.all(
                                  color: Colors
                                      .white, //                   <--- border color
                                  width: 2.0,
                                )
                              : Border.all(),
                        ),
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text('s${index + 1}'),
                      ),
                    );
                  },
                  childCount: 150,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox.square(
                    dimension: 30,
                    child: Container(
                      color: const Color(0xFF514F64),
                    ),
                  ),
                  Text(currentDate.toString()),
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox.square(
                    dimension: 30,
                    child: Container(
                      color: const Color(0xFF195777),
                    ),
                  ),
                  const Text("Booked"),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Color(0xFF2F2C44),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Text(
                        "Billing",
                        style: GoogleFonts.openSans(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Number of Seats")),
                          Text(selectedSeats.length.toString())
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Seats")),
                          Text(selectedSeats.toString())
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Price(10Rs/per seat)")),
                          Text("${selectedSeats.length * 10}Rs/-")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GradiantButton(
                          width: MediaQuery.of(context).size.width - 32,
                          borderRadius: BorderRadius.circular(12),
                          onPressed: () {
                            AutoRouter.of(context)
                                .push(const FinalTicketRoute());
                            // ref
                            //     .read(seatSelectionViewModelProvider.notifier)
                            //     .makePayment(_datePickerController.selectedDate);
                          },
                          child: Text(
                            "Book Tickets",
                            style: GoogleFonts.openSans(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}

class SeatingWidget extends StatelessWidget {
  const SeatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.height,
      color: Colors.yellow,
      child: Text("1"),
    );
  }
}
