import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:smt/presenter/index.dart';

class CarryOutSubView extends ConsumerWidget {
  const CarryOutSubView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    DropdownMenu getDropdownMenu(String menuName, BoxConstraints boxConstraints, List<DropdownMenuEntry> menuEntries) {
      return DropdownMenu(
        label: Text(menuName),
        width: boxConstraints.maxWidth,
        dropdownMenuEntries: menuEntries,
        initialSelection: menuEntries[0].value,
        onSelected: (_) {
          FocusScope.of(context).requestFocus(ref.read(StoreManagerControl.focusNodeOfScanField));
        },
      );
    }

    DropdownMenu getPersonNameMenu(BoxConstraints boxConstraints) {
      List<DropdownMenuEntry> menuEntries = const <DropdownMenuEntry>[
        DropdownMenuEntry(value: 'personValue', label: 'personLabel'),
      ];

      return getDropdownMenu('Person', boxConstraints, menuEntries);
    }

    DropdownMenu getLocationMenu(BoxConstraints boxConstraints) {
      List<DropdownMenuEntry> menuEntries = const <DropdownMenuEntry>[
        DropdownMenuEntry(value: 'locationValue', label: 'locationLabel'),
      ];

      return getDropdownMenu('Location', boxConstraints, menuEntries);
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
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
        ],
      ),
    );
  }
}
