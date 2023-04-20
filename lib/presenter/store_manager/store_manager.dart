import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class StoreManagerControl {
  static const _instance = StoreManagerControl._singleton();
  factory StoreManagerControl() => _instance;
  const StoreManagerControl._singleton();

  static final StateProvider<bool> ioMode = StateProvider<bool>(
    (ref) {
      return false;
    },
  );

  static final Provider<FocusNode> focusNodeOfScanField = Provider<FocusNode>(
    (ref) {
      return FocusNode();
    },
  );
}
