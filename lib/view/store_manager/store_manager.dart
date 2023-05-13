import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/common/index.dart';
import 'package:rainbow/entity/index.dart';
import 'package:rainbow/presenter/index.dart';

import 'store_manager_appbar.dart';

class StoreManager extends ConsumerWidget {
  const StoreManager({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    const EdgeInsets padding = EdgeInsets.all(16);

    return Scaffold(
      appBar: const StoreManagerAppBar(),
      body: SizedBox.expand(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: size.width,
                padding: padding,
                child: const Column(
                  children: <Widget>[
                    StoreManagerDropdown(),
                    SizedBox(height: 16),
                    StoreManagerScannedItemList(),
                    SizedBox(height: 16),
                    StoreManagerExchangeButton(),
                  ],
                ),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Container(
                width: size.width,
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${ref.watch(StoreManagerControl.carriedItemList).length} Items Carried'),
                    Expanded(
                      child: ListView(
                        children: const <Widget>[],
                      ),
                    ),
                  ],
                ),
              ),
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
    return const Column(
      children: <Widget>[
        WIP(text: 'Person DropdownMenu', height: 64),
        WIP(text: 'Location DropdownMenu', height: 64),
      ],
    );
  }
}

class StoreManagerScannedItemList extends ConsumerWidget {
  const StoreManagerScannedItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ScannedItem> scannedItemList = ref.watch(StoreManagerControl.scannedItemList);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Scanned ${scannedItemList.length} Items'),
          Expanded(
            child: ListView(
              children: <Widget>[
                for (final ScannedItem scannedItem in scannedItemList) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(scannedItem.name),
                      IconButton(
                        onPressed: () {
                          ref.read(StoreManagerControl.scannedItemList.notifier).removeItem(scannedItem);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoreManagerExchangeButton extends ConsumerWidget {
  const StoreManagerExchangeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recoveringMode = ref.watch(StoreManagerControl.recoveringMode);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 128,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          recoveringMode ? 'Bring' : 'Carry',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
