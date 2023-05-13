import 'package:flutter/material.dart';
import 'package:rainbow/view/index.dart';

enum View {
  home,
  storeManager,
}

class Router {
  static const _instance = Router._singleton();
  factory Router() => _instance;
  const Router._singleton();

  static MaterialPageRoute onGeneratedRoute(RouteSettings routeSettings) {
    Widget targetView;
    switch (routeSettings.name) {
      case 'home':
        targetView = const HomeView();
        break;
      case 'storeManager':
        targetView = const StoreManager();
        break;
      default:
        targetView = const Center(child: Text('Not Found'));
    }
    return MaterialPageRoute(builder: (context) => targetView);
  }
}
