import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'recovering_switch.dart';
import 'code_scanner.dart';

class StoreManagerAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const StoreManagerAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RecoveringSwitch(),
          CodeScanner(),
        ],
      ),
    );
  }
}
