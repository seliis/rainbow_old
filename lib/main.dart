import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/router/index.dart' as router;

void main() async {
  await Hive.initFlutter();

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'JetBrains Mono',
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        initialRoute: router.View.home.name,
        onGenerateRoute: router.Router.onGeneratedRoute,
      ),
    ),
  );
}
