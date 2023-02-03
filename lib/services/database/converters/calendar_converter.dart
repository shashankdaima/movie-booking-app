import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

class CalendarConverter extends TypeConverter<DateTime, String> {
  @override
  DateTime decode(String databaseValue) {
    debugPrint(databaseValue);
    return DateTime(2000);
  }

  @override
  String encode(DateTime value) {
    return {"date": value.day, "month": value.month, "year": value.year}
        .toString();
  }
}
