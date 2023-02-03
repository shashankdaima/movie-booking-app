// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ReservationDao? _reservationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Reservation` (`name` TEXT NOT NULL, `email` TEXT NOT NULL, `startingDate` TEXT NOT NULL, `seatNo` TEXT NOT NULL, `movieId` TEXT NOT NULL, `movieSlotId` TEXT NOT NULL, PRIMARY KEY (`seatNo`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ReservationDao get reservationDao {
    return _reservationDaoInstance ??=
        _$ReservationDao(database, changeListener);
  }
}

class _$ReservationDao extends ReservationDao {
  _$ReservationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _reservationInsertionAdapter = InsertionAdapter(
            database,
            'Reservation',
            (Reservation item) => <String, Object?>{
                  'name': item.name,
                  'email': item.email,
                  'startingDate': _calendarConverter.encode(item.startingDate),
                  'seatNo': item.seatNo,
                  'movieId': item.movieId,
                  'movieSlotId': item.movieSlotId
                },
            changeListener),
        _reservationDeletionAdapter = DeletionAdapter(
            database,
            'Reservation',
            ['seatNo'],
            (Reservation item) => <String, Object?>{
                  'name': item.name,
                  'email': item.email,
                  'startingDate': _calendarConverter.encode(item.startingDate),
                  'seatNo': item.seatNo,
                  'movieId': item.movieId,
                  'movieSlotId': item.movieSlotId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Reservation> _reservationInsertionAdapter;

  final DeletionAdapter<Reservation> _reservationDeletionAdapter;

  @override
  Stream<List<Reservation>> getAllReservations() {
    return _queryAdapter.queryListStream('SELECT * FROM Reservation',
        mapper: (Map<String, Object?> row) => Reservation(
            name: row['name'] as String,
            email: row['email'] as String,
            startingDate:
                _calendarConverter.decode(row['startingDate'] as String),
            seatNo: row['seatNo'] as String,
            movieId: row['movieId'] as String,
            movieSlotId: row['movieSlotId'] as String),
        queryableName: 'Reservation',
        isView: false);
  }

  @override
  Future<void> insertReservation(Reservation reservation) async {
    await _reservationInsertionAdapter.insert(
        reservation, OnConflictStrategy.replace);
  }

  @override
  Future<void> removeReservation(Reservation reservation) async {
    await _reservationDeletionAdapter.delete(reservation);
  }
}

// ignore_for_file: unused_element
final _calendarConverter = CalendarConverter();
