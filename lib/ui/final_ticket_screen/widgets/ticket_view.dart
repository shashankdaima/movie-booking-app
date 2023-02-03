import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketView extends ConsumerWidget {
  const TicketView({required this.reservation, super.key});
  final Reservation reservation;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        // ignore: sort_child_properties_last
        child: Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 14, bottom: 14),
            child: SizedBox(
                height: 115,
                child: Row(
                  children: [
                    SizedBox.square(
                        child: QrImage(
                      data:
                          'https://www.moviebooking.com/tickets?pid=${reservation.movieSlotId}&hostEmail=${reservation.email}&seatId=${reservation.seatNo}',
                      version: QrVersions.auto,
                      gapless: false,
                    )),
                    const SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(reservation.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          Text("Seat no- ${reservation.seatNo}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14)),
                          Text(reservation.startingDate.toString(),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14)),
                          Text("AVATAR:ways of water",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14)),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(10, 0),
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: Text(
                          "SHARE",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ))),
        painter: HeaderPainter(),
      ),
    );
  }
}

class HeaderPainter extends CustomPainter {
  double cardRadius = 16;
  Path ticketOutlinePath = Path();
  Path dividerLinePath = Path();
  Path sharePartPath = Path();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint blackLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint sharePaint = Paint()
      ..color = const Color(0xFFFF9B9B)
      ..style = PaintingStyle.fill;

    ticketOutlinePath.moveTo(0, cardRadius);
    ticketOutlinePath.arcToPoint(
      Offset(cardRadius, 0),
      radius: Radius.circular(cardRadius),
    );
    ticketOutlinePath.lineTo(size.height, 0);
    ticketOutlinePath.arcToPoint(Offset(size.height + 2 * cardRadius, 0),
        radius: Radius.circular(cardRadius), clockwise: false);
    ticketOutlinePath.lineTo(size.width - cardRadius, 0);
    ticketOutlinePath.arcToPoint(
      Offset(size.width, cardRadius),
      radius: Radius.circular(cardRadius),
    );
    ticketOutlinePath.lineTo(size.width, size.height - cardRadius);
    ticketOutlinePath.arcToPoint(
      Offset(size.width - cardRadius, size.height),
      radius: Radius.circular(cardRadius),
    );
    ticketOutlinePath.lineTo(size.height + 2 * cardRadius, size.height);
    ticketOutlinePath.arcToPoint(Offset(size.height, size.height),
        radius: Radius.circular(cardRadius), clockwise: false);
    ticketOutlinePath.lineTo(cardRadius, size.height);
    ticketOutlinePath.arcToPoint(Offset(0, size.height - cardRadius),
        radius: Radius.circular(cardRadius));
    ticketOutlinePath.lineTo(0, cardRadius);

    dividerLinePath.moveTo(size.height + cardRadius, cardRadius);
    dividerLinePath.lineTo(size.height + cardRadius, size.height - cardRadius);
    sharePartPath.moveTo(size.width - cardRadius - 20, 0);
    sharePartPath.lineTo(size.width - cardRadius, 0);
    sharePartPath.arcToPoint(
      Offset(size.width, cardRadius),
      radius: Radius.circular(cardRadius),
    );
    sharePartPath.lineTo(size.width, size.height - cardRadius);
    sharePartPath.arcToPoint(
      Offset(size.width - cardRadius, size.height),
      radius: Radius.circular(cardRadius),
    );
    sharePartPath.lineTo(size.width - cardRadius - 20, size.height);
    sharePartPath.lineTo(size.width - cardRadius - 20, 0);

    canvas.drawPath(ticketOutlinePath, paint);
    canvas.drawPath(dividerLinePath, blackLinePaint);
    canvas.drawPath(sharePartPath, sharePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool? hitTest(Offset position) {
    // return (blueCardPath.contains(position));
    if (ticketOutlinePath.contains(position)) {
      return true;
    }
    return super.hitTest(position);
  }
}

class HeaderChip extends StatelessWidget {
  const HeaderChip({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title),
      labelStyle: const TextStyle(color: Colors.white70),
      backgroundColor: const Color(0xFF7650FD),
      shape: const StadiumBorder(side: BorderSide(color: Colors.white12)),
    );
  }
}
