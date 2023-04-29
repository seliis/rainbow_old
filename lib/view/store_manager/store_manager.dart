import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/common/index.dart';

import 'store_manager_appbar.dart';
import 'recovering_switch.dart';
import 'control_panel.dart';
import 'code_scanner.dart';
import 'carried_list.dart';

class StoreManager extends ConsumerWidget {
  const StoreManager({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const StoreManagerAppBar(),
      body: SizedBox.expand(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: const <Widget>[
                  StoreManagerDropdown(),
                ],
              ),
            ),
            const VerticalDivider(),
            const Expanded(
              child: WIP(text: 'Carried ItemList'),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreManagerDropdown extends ConsumerWidget {
  const StoreManagerDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const <Widget>[
        WIP(text: 'Person DropdownMenu', height: 64),
        WIP(text: 'Location DropdownMenu', height: 64),
      ],
    );
  }
}
