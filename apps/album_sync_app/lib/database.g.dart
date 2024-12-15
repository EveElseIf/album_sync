// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $XiaomiConfigItemTable extends XiaomiConfigItem
    with TableInfo<$XiaomiConfigItemTable, XiaomiConfigItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $XiaomiConfigItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _readyMeta = const VerificationMeta('ready');
  @override
  late final GeneratedColumn<bool> ready = GeneratedColumn<bool>(
      'ready', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("ready" IN (0, 1))'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ready, username, password, deviceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'xiaomi_config_item';
  @override
  VerificationContext validateIntegrity(
      Insertable<XiaomiConfigItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ready')) {
      context.handle(
          _readyMeta, ready.isAcceptableOrUnknown(data['ready']!, _readyMeta));
    } else if (isInserting) {
      context.missing(_readyMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  XiaomiConfigItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return XiaomiConfigItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ready: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ready'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
    );
  }

  @override
  $XiaomiConfigItemTable createAlias(String alias) {
    return $XiaomiConfigItemTable(attachedDatabase, alias);
  }
}

class XiaomiConfigItemData extends DataClass
    implements Insertable<XiaomiConfigItemData> {
  final int id;
  final bool ready;
  final String username;
  final String password;
  final String deviceId;
  const XiaomiConfigItemData(
      {required this.id,
      required this.ready,
      required this.username,
      required this.password,
      required this.deviceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ready'] = Variable<bool>(ready);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['device_id'] = Variable<String>(deviceId);
    return map;
  }

  XiaomiConfigItemCompanion toCompanion(bool nullToAbsent) {
    return XiaomiConfigItemCompanion(
      id: Value(id),
      ready: Value(ready),
      username: Value(username),
      password: Value(password),
      deviceId: Value(deviceId),
    );
  }

  factory XiaomiConfigItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return XiaomiConfigItemData(
      id: serializer.fromJson<int>(json['id']),
      ready: serializer.fromJson<bool>(json['ready']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ready': serializer.toJson<bool>(ready),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'deviceId': serializer.toJson<String>(deviceId),
    };
  }

  XiaomiConfigItemData copyWith(
          {int? id,
          bool? ready,
          String? username,
          String? password,
          String? deviceId}) =>
      XiaomiConfigItemData(
        id: id ?? this.id,
        ready: ready ?? this.ready,
        username: username ?? this.username,
        password: password ?? this.password,
        deviceId: deviceId ?? this.deviceId,
      );
  XiaomiConfigItemData copyWithCompanion(XiaomiConfigItemCompanion data) {
    return XiaomiConfigItemData(
      id: data.id.present ? data.id.value : this.id,
      ready: data.ready.present ? data.ready.value : this.ready,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('XiaomiConfigItemData(')
          ..write('id: $id, ')
          ..write('ready: $ready, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ready, username, password, deviceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is XiaomiConfigItemData &&
          other.id == this.id &&
          other.ready == this.ready &&
          other.username == this.username &&
          other.password == this.password &&
          other.deviceId == this.deviceId);
}

class XiaomiConfigItemCompanion extends UpdateCompanion<XiaomiConfigItemData> {
  final Value<int> id;
  final Value<bool> ready;
  final Value<String> username;
  final Value<String> password;
  final Value<String> deviceId;
  const XiaomiConfigItemCompanion({
    this.id = const Value.absent(),
    this.ready = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.deviceId = const Value.absent(),
  });
  XiaomiConfigItemCompanion.insert({
    this.id = const Value.absent(),
    required bool ready,
    required String username,
    required String password,
    required String deviceId,
  })  : ready = Value(ready),
        username = Value(username),
        password = Value(password),
        deviceId = Value(deviceId);
  static Insertable<XiaomiConfigItemData> custom({
    Expression<int>? id,
    Expression<bool>? ready,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? deviceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ready != null) 'ready': ready,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (deviceId != null) 'device_id': deviceId,
    });
  }

  XiaomiConfigItemCompanion copyWith(
      {Value<int>? id,
      Value<bool>? ready,
      Value<String>? username,
      Value<String>? password,
      Value<String>? deviceId}) {
    return XiaomiConfigItemCompanion(
      id: id ?? this.id,
      ready: ready ?? this.ready,
      username: username ?? this.username,
      password: password ?? this.password,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ready.present) {
      map['ready'] = Variable<bool>(ready.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('XiaomiConfigItemCompanion(')
          ..write('id: $id, ')
          ..write('ready: $ready, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $XiaomiConfigItemTable xiaomiConfigItem =
      $XiaomiConfigItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [xiaomiConfigItem];
}

typedef $$XiaomiConfigItemTableCreateCompanionBuilder
    = XiaomiConfigItemCompanion Function({
  Value<int> id,
  required bool ready,
  required String username,
  required String password,
  required String deviceId,
});
typedef $$XiaomiConfigItemTableUpdateCompanionBuilder
    = XiaomiConfigItemCompanion Function({
  Value<int> id,
  Value<bool> ready,
  Value<String> username,
  Value<String> password,
  Value<String> deviceId,
});

class $$XiaomiConfigItemTableFilterComposer
    extends Composer<_$AppDatabase, $XiaomiConfigItemTable> {
  $$XiaomiConfigItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ready => $composableBuilder(
      column: $table.ready, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));
}

class $$XiaomiConfigItemTableOrderingComposer
    extends Composer<_$AppDatabase, $XiaomiConfigItemTable> {
  $$XiaomiConfigItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ready => $composableBuilder(
      column: $table.ready, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));
}

class $$XiaomiConfigItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $XiaomiConfigItemTable> {
  $$XiaomiConfigItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get ready =>
      $composableBuilder(column: $table.ready, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);
}

class $$XiaomiConfigItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $XiaomiConfigItemTable,
    XiaomiConfigItemData,
    $$XiaomiConfigItemTableFilterComposer,
    $$XiaomiConfigItemTableOrderingComposer,
    $$XiaomiConfigItemTableAnnotationComposer,
    $$XiaomiConfigItemTableCreateCompanionBuilder,
    $$XiaomiConfigItemTableUpdateCompanionBuilder,
    (
      XiaomiConfigItemData,
      BaseReferences<_$AppDatabase, $XiaomiConfigItemTable,
          XiaomiConfigItemData>
    ),
    XiaomiConfigItemData,
    PrefetchHooks Function()> {
  $$XiaomiConfigItemTableTableManager(
      _$AppDatabase db, $XiaomiConfigItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$XiaomiConfigItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$XiaomiConfigItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$XiaomiConfigItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> ready = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
          }) =>
              XiaomiConfigItemCompanion(
            id: id,
            ready: ready,
            username: username,
            password: password,
            deviceId: deviceId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool ready,
            required String username,
            required String password,
            required String deviceId,
          }) =>
              XiaomiConfigItemCompanion.insert(
            id: id,
            ready: ready,
            username: username,
            password: password,
            deviceId: deviceId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$XiaomiConfigItemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $XiaomiConfigItemTable,
    XiaomiConfigItemData,
    $$XiaomiConfigItemTableFilterComposer,
    $$XiaomiConfigItemTableOrderingComposer,
    $$XiaomiConfigItemTableAnnotationComposer,
    $$XiaomiConfigItemTableCreateCompanionBuilder,
    $$XiaomiConfigItemTableUpdateCompanionBuilder,
    (
      XiaomiConfigItemData,
      BaseReferences<_$AppDatabase, $XiaomiConfigItemTable,
          XiaomiConfigItemData>
    ),
    XiaomiConfigItemData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$XiaomiConfigItemTableTableManager get xiaomiConfigItem =>
      $$XiaomiConfigItemTableTableManager(_db, _db.xiaomiConfigItem);
}
