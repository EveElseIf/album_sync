import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class XiaomiConfigItem extends Table {
  IntColumn get id => integer()();

  BoolColumn get ready => boolean()();

  TextColumn get username => text()();

  TextColumn get password => text()();

  TextColumn get deviceId => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(tables: [XiaomiConfigItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: "album_sync_db");
  }
}
