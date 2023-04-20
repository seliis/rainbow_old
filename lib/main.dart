import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import 'package:smt/router/index.dart';

void main() async {
  await Hive.initFlutter();

  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        initialRoute: View.home.name,
        onGenerateRoute: AppRouter.onGeneratedRoute,
      ),
    ),
  );
}
