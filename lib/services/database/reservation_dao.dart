import 'package:floor/floor.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';

@dao
abstract class ReservationDao {
  @Query("SELECT * FROM Reservation")
  Stream<List<Reservation>> getAllReservations();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertReservation(Reservation reservation);

  @delete
  Future<void> removeReservation(Reservation reservation);
}
