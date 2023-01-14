import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';

import '../widgets/gradiant_button.dart';

class SeatSelectionScreen extends ConsumerStatefulWidget {
  const SeatSelectionScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends ConsumerState<SeatSelectionScreen> {
  DatePickerController _datePickerController = DatePickerController();

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    DateTime startDate = now.subtract(Duration(days: 14));
    DateTime endDate = now.add(Duration(days: 7));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Avenger:Infinity Wars",
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
                print('selected = ${date.toIso8601String()}');
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      color: Color(0xFF514F64),
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Text('$index'),
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
                  const Text("Available"),
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
                          Text("2")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [Expanded(child: Text("Seats")), Text("2,3")],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(child: Text("Price(10Rs/per seat)")),
                          Text("20 Rs/-")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GradiantButton(
                          width: MediaQuery.of(context).size.width - 32,
                          borderRadius: BorderRadius.circular(12),
                          onPressed: () {
                            // AutoRouter.of(context).push(SeatSelectionRoute());
                          },
                          child: Text(
                            "Book Table",
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
