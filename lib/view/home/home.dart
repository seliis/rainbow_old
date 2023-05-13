import 'package:flutter/material.dart';

import 'package:rainbow/router/index.dart' as router;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox makeTextButton(String buttonName, Function() onPressed) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.50,
        height: 64,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 64,
            ),
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w100,
              fontFamily: 'JetBrains Mono',
            ),
          ),
          child: Text(buttonName),
        ),
      );
    }

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            makeTextButton('Manage Store', () {
              Navigator.pushNamed(
                context,
                router.View.storeManager.name,
              );
            }),
            const SizedBox(
              height: 8,
            ),
            makeTextButton('Make Code', () {}),
            const SizedBox(
              height: 8,
            ),
            makeTextButton('Settings', () {}),
          ],
        ),
      ),
    );
  }
}
