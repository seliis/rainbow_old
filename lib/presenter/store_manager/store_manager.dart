import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:rainbow/entity/index.dart';

class StoreManagerControl {
  static const _instance = StoreManagerControl._singleton();
  factory StoreManagerControl() => _instance;
  const StoreManagerControl._singleton();

  static String getCurrentTime({DateTime? dateTime, String dateFormat = 'yyyy-MM-dd hh:mm:ss'}) {
    if (dateTime == null) {
      return DateFormat(dateFormat).format(DateTime.now());
    }
    return DateFormat(dateFormat).format(dateTime);
  }

  static final AutoDisposeProvider<TextEditingController> personController = AutoDisposeProvider<TextEditingController>(
    (ref) {
      return TextEditingController();
    },
  );

  static final AutoDisposeProvider<TextEditingController> locationController = AutoDisposeProvider<TextEditingController>(
    (ref) {
      return TextEditingController();
    },
  );

  static final AutoDisposeStreamProvider<String> currentTime = StreamProvider.autoDispose<String>(
    (ref) async* {
      final StreamController<DateTime> timeStream = StreamController<DateTime>();
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timeStream.isClosed) {
          timer.cancel();
          return;
        }
        timeStream.add(DateTime.now());
      });

      ref.onDispose(() {
        timeStream.close();
      });

      await for (final DateTime now in timeStream.stream) {
        yield getCurrentTime(dateTime: now);
      }
    },
  );

  static final StateNotifierProvider<ScannedItemListNotifier, List<ScannedItem>> scannedItemList = StateNotifierProvider<ScannedItemListNotifier, List<ScannedItem>>(
    (ref) {
      return ScannedItemListNotifier();
    },
  );

  static final StateNotifierProvider<CarriedItemListNotifier, List<CarriedItem>> carriedItemList = StateNotifierProvider<CarriedItemListNotifier, List<CarriedItem>>(
    (ref) {
      return CarriedItemListNotifier();
    },
  );

  static final StateProvider<bool> recoveringMode = StateProvider<bool>(
    (ref) {
      return false;
    },
  );
}

class ScannedItemListNotifier extends StateNotifier<List<ScannedItem>> {
  ScannedItemListNotifier() : super(<ScannedItem>[]);

  void addItem(ScannedItem scannedItem) {
    state = <ScannedItem>[
      ...state,
      scannedItem
    ];
  }

  void removeItem(ScannedItem scannedItem) {
    state = <ScannedItem>[
      for (final ScannedItem item in state) ...[
        if (item.id != scannedItem.id) ...[
          item,
        ],
      ],
    ];
  }

  void resetList() {
    state = <ScannedItem>[];
  }
}

class CarriedItemListNotifier extends StateNotifier<List<CarriedItem>> {
  CarriedItemListNotifier() : super(<CarriedItem>[]);

  void addItem(CarriedItem carriedItem) {
    state = <CarriedItem>[
      ...state,
      carriedItem,
    ];
  }

  void removeItem(CarriedItem carriedItem) {
    state = <CarriedItem>[
      for (final CarriedItem item in state) ...[
        if (item.id != carriedItem.id) ...[
          item,
        ],
      ],
    ];
  }
}
