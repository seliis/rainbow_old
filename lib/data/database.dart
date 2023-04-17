import 'package:hive/hive.dart';

enum BoxName {
  test,
}

class Database {
  static const _instance = Database._singleton();
  factory Database() => _instance;
  const Database._singleton();

  static Box<String>? _testBoxObject;

  static Future<Box<String>> get _testBox async {
    return _testBoxObject ??= await Hive.openBox(BoxName.test.name);
  }

  static Future<Box<String>> _getBoxByName(BoxName boxName) async {
    switch (boxName) {
      case BoxName.test:
        return await _testBox;
    }
  }

  static Future<void> write(BoxName boxName, String key, String value) async {
    await _getBoxByName(boxName).then((box) async => await box.put(key, value));
  }

  static Future<String?> read(BoxName boxName, String key) async {
    return await _getBoxByName(boxName).then((box) => box.get(key));
  }

  static Future<void> delete(BoxName boxName, String key) async {
    await _getBoxByName(boxName).then((box) async => await box.delete(key));
  }

  static Future<void> clear(BoxName boxName) async {
    await _getBoxByName(boxName).then((box) async => await box.clear());
  }
}
