import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/presenter/index.dart';
import 'package:rainbow/entity/index.dart';

class ControlPanel extends ConsumerWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ScannedItem> scannedItemList = ref.watch(StoreManagerControl.scannedItemList);

    LayoutBuilder getDaughterLayout(Widget Function(BoxConstraints boxConstraints) makeFunction) {
      return LayoutBuilder(
        builder: (_, constraints) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: makeFunction(constraints),
          );
        },
      );
    }

    DropdownMenu getDropdownMenu(String menuName, TextEditingController controller, BoxConstraints boxConstraints, List<DropdownMenuEntry> menuEntries) {
      return DropdownMenu(
        label: Text(menuName),
        controller: controller,
        width: boxConstraints.maxWidth,
        dropdownMenuEntries: menuEntries,
        initialSelection: menuEntries[0].value,
        onSelected: null,
      );
    }

    DropdownMenu getPersonNameMenu(BoxConstraints boxConstraints) {
      List<DropdownMenuEntry> menuEntries = const <DropdownMenuEntry>[
        DropdownMenuEntry(value: 'personValue', label: 'personLabel'),
      ];

      return getDropdownMenu('Person', ref.watch(StoreManagerControl.personController), boxConstraints, menuEntries);
    }

    DropdownMenu getLocationMenu(BoxConstraints boxConstraints) {
      List<DropdownMenuEntry> menuEntries = const <DropdownMenuEntry>[
        DropdownMenuEntry(value: 'locationValue', label: 'locationLabel'),
      ];

      return getDropdownMenu('Location', ref.watch(StoreManagerControl.locationController), boxConstraints, menuEntries);
    }

    SizedBox getScannedItemList(BoxConstraints boxConstraints) {
      Widget getItemPanel(ScannedItem scannedItem) {
        return Row(
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
        );
      }

      return SizedBox(
        width: boxConstraints.maxWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('SCANNED LIST: ${scannedItemList.length} Items'),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: ListView(
                children: <Widget>[
                  for (ScannedItem scannedItem in scannedItemList) ...[
                    getItemPanel(scannedItem),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    }

    SizedBox getTransferButton(BoxConstraints boxConstraints) {
      String getButtonText() {
        if (ref.watch(StoreManagerControl.recoveringMode) == true) {
          return 'Bring';
        }
        return 'Carry';
      }

      return SizedBox(
        width: boxConstraints.maxWidth,
        height: 64,
        child: ElevatedButton(
          onPressed: () {
            final notifier = ref.read(StoreManagerControl.carriedItemList.notifier);
            if (ref.read(StoreManagerControl.recoveringMode) == false) {
              for (final ScannedItem scannedItem in scannedItemList) {
                notifier.addItem(CarriedItem(
                  id: scannedItem.id,
                  time: StoreManagerControl.getCurrentTime(),
                  name: scannedItem.name,
                  person: ref.read(StoreManagerControl.personController).text,
                  location: ref.read(StoreManagerControl.locationController).text,
                ));
              }
            } else {
              for (final ScannedItem scannedItem in scannedItemList) {
                for (final CarriedItem carriedItem in ref.read(StoreManagerControl.carriedItemList)) {
                  if (scannedItem.id == carriedItem.id) {
                    notifier.removeItem(carriedItem);
                    break;
                  }
                }
              }
            }
            ref.read(StoreManagerControl.scannedItemList.notifier).resetList();
          },
          child: Text(
            getButtonText(),
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getDaughterLayout(
            (boxConstraints) {
              return getPersonNameMenu(boxConstraints);
            },
          ),
          getDaughterLayout(
            (boxConstraints) {
              return getLocationMenu(boxConstraints);
            },
          ),
          getDaughterLayout(
            (boxConstraints) {
              return getScannedItemList(boxConstraints);
            },
          ),
          getDaughterLayout(
            (boxConstraints) {
              return getTransferButton(boxConstraints);
            },
          ),
        ],
      ),
    );
  }
}
