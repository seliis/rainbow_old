// ignore_for_file: avoid_print
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rainbow/data/index.dart';

void main() async {
  test('database', () async {
    Hive.init('./temp');
    await Database.write(BoxName.test, 'testKey', 'testValue');
    print(await Database.read(BoxName.test, 'testKey'));
    await Database.delete(BoxName.test, 'testKey');
    print(await Database.read(BoxName.test, 'testKey'));
  });
}
