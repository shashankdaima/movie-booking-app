class Reservation {
  final String name;
  final DateTime startingDate;
  final String seatNo;
  final String movieId;
  final String movieSlotId;
  const Reservation({
    required this.name,
    required this.startingDate,
    required this.seatNo,
    required this.movieId,
    required this.movieSlotId,
  });
}
