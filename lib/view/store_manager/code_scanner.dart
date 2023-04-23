import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/presenter/index.dart';
import 'package:rainbow/entity/index.dart';

class CodeScanner extends ConsumerWidget {
  const CodeScanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BarcodeKeyboardListener(
      onBarcodeScanned: (scannedStream) {
        if (scannedStream.isEmpty) {
          return;
        }
        final notifier = ref.read(StoreManagerControl.scannedItemList.notifier);
        if (ref.watch(StoreManagerControl.recoveringMode) == false) {
          notifier.addItem(
            ScannedItem(
              id: DateTime.now().toString(),
              name: scannedStream,
            ),
          );
        } else {
          final carriedItemList = ref.read(StoreManagerControl.carriedItemList);

          bool isSame(CarriedItem carriedItem) {
            if (carriedItem.name == scannedStream && carriedItem.person == ref.read(StoreManagerControl.personController).text && carriedItem.location == ref.read(StoreManagerControl.locationController).text) {
              return true;
            }
            return false;
          }

          for (final CarriedItem carriedItem in carriedItemList) {
            if (isSame(carriedItem) == true) {
              notifier.addItem(
                ScannedItem(
                  id: carriedItem.id,
                  name: carriedItem.name,
                ),
              );
            }
          }
        }
      },
      bufferDuration: const Duration(milliseconds: 200),
      child: ref.watch(StoreManagerControl.currentTime).when(
        data: (currentTime) {
          return Text(
            currentTime,
            style: const TextStyle(
              fontWeight: FontWeight.w100,
            ),
          );
        },
        error: (error, stackTrace) {
          return const Text(
            'ERROR',
            style: TextStyle(
              fontWeight: FontWeight.w100,
            ),
          );
        },
        loading: () {
          return const Text(
            '0000-00-00 00:00:00',
            style: TextStyle(
              fontWeight: FontWeight.w100,
            ),
          );
        },
      ),
    );
  }
}
