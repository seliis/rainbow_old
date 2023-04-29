import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'code_scanner.dart';

class StoreManagerAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const StoreManagerAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          SizedBox.shrink(),
          CodeScanner(),
        ],
      ),
    );
  }
}
