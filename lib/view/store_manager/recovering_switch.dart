import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/presenter/index.dart';

class RecoveringSwitch extends ConsumerWidget {
  const RecoveringSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: <Widget>[
        const Text(
          'RECOVERING',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Switch(
          value: ref.watch(StoreManagerControl.recoveringMode),
          onChanged: (value) {
            ref.read(StoreManagerControl.recoveringMode.notifier).state = value;
          },
        ),
      ],
    );
  }
}
