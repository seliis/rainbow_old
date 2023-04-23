import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'recovering_switch.dart';
import 'control_panel.dart';
import 'code_scanner.dart';
import 'carried_list.dart';

class StoreManager extends ConsumerWidget {
  const StoreManager({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            RecoveringSwitch(),
            CodeScanner(),
          ],
        ),
      ),
      body: SizedBox.expand(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            ControlPanel(),
            VerticalDivider(),
            CarriedList(),
          ],
        ),
      ),
    );
  }
}
