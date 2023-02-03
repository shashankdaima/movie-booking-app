import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_app/models/responses/reservation.dart';
import 'package:movie_booking_app/services/database/converters/calendar_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import "reservation_dao.dart";

part 'app_database.g.dart';

// final appDatabaseProvider=Provider()
final appDatabaseProvider = Provider((ref) async =>
    await $FloorAppDatabase.databaseBuilder("app_database.db").build());

@TypeConverters([CalendarConverter])
@Database(version: 2, entities: [Reservation])
abstract class AppDatabase extends FloorDatabase {
  ReservationDao get reservationDao;
}
