import 'package:floor/floor.dart';

@entity
class Reservation {
  final String name;
  final String email;
  final DateTime startingDate;
  @primaryKey
  final String seatNo;
  final String movieId;
  final String movieSlotId;
  const Reservation({
    required this.name,
    required this.email,
    required this.startingDate,
    required this.seatNo,
    required this.movieId,
    required this.movieSlotId,
  });
}
