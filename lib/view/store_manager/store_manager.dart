import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:smt/presenter/index.dart';
import 'package:smt/common/index.dart';

import 'carry_out.dart';

class StoreManager extends ConsumerWidget {
  const StoreManager({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4225,
              child: TextFormField(
                autofocus: true,
                focusNode: ref.read(StoreManagerControl.focusNodeOfScanField),
                readOnly: false, // need to turn true in release.
                showCursor: false,
                inputFormatters: <TextInputFormatter>[
                  UpperCaseTextFormatter(),
                ],
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(ref.read(StoreManagerControl.focusNodeOfScanField));
                },
                onEditingComplete: () {},
              ),
            ),
            Row(
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
                  value: ref.watch(StoreManagerControl.ioMode),
                  onChanged: (value) {
                    ref.read(StoreManagerControl.ioMode.notifier).state = value;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SizedBox.expand(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const CarryOutSubView(),
            const VerticalDivider(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: const Text('Right'),
            )
          ],
        ),
      ),
    );
  }
}
