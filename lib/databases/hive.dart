import 'dart:io';

import 'package:hive/hive.dart';
import 'package:integral_nutry/models/user.dart';
import 'package:path_provider/path_provider.dart';

/// Hive Database
/// https://docs.hivedb.dev/#/
class HiveDatabase {

  /// Singleton pattern
  static final HiveDatabase _hiveDatabase = HiveDatabase._internal();
  factory HiveDatabase() => _hiveDatabase;
  HiveDatabase._internal();

  /// Attributes
  bool _initialized = false;

  /// Init Hive instance
  Future<void> _init() async {

    // Get directory to storage data
    Directory dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);

    // Hive initialized
    _initialized = true;
  }

  /// Get box name by type generic
  String _getBoxName<T>() {
    switch(T) {
      case User: return "user";

      default: throw Exception("Box name not found");
    }
  }

  Future<void> setData<T>(String key, dynamic value) async {
    // Check initialization
    if(!_initialized) await _init();

    Box box = await Hive.openBox(_getBoxName<T>());

    await box.put(key, value);
  }

  Future<dynamic> getData<T>(String key) async {
    // Check initialization
    if(!_initialized) await _init();

    Box box = await Hive.openBox(_getBoxName<T>());

    return box.get(key);
  }

  Future<void> addData<T>(T data) async {
    // Check initialization
    if(!_initialized) await _init();

    Box<T> box = await Hive.openBox<T>(_getBoxName<T>());

    int result = await box.add(data);

    print("[ HIVE DB ] return from box add $result");

  }

}