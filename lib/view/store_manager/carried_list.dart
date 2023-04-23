import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:rainbow/presenter/index.dart';
import 'package:rainbow/entity/index.dart';

class CarriedList extends ConsumerWidget {
  const CarriedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'CARRIED LIST: ${ref.watch(StoreManagerControl.carriedItemList).length.toString()} Items',
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView(
              children: <CarriedItemPanel>[
                for (final CarriedItem carriedItem in ref.watch(StoreManagerControl.carriedItemList)) ...[
                  CarriedItemPanel(
                    carriedItem: carriedItem,
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

class CarriedItemPanel extends ConsumerWidget {
  const CarriedItemPanel({
    super.key,
    required this.carriedItem,
  });

  final CarriedItem carriedItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
      ),
      height: MediaQuery.of(context).size.height * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            carriedItem.name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox.shrink(),
              Text(
                'Carried by ${carriedItem.person} to ${carriedItem.location} at ${carriedItem.time}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
