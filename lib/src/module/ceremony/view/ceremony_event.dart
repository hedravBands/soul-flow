import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';
import 'ceremony_page.dart';

class CeremonyEvent extends ConsumerWidget {
  const CeremonyEvent({
    Key? key,
    required this.ceremony,
  }) : super(key: key);

  final String ceremony;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ceremonyProvider = eventProvider;
    final AsyncValue<int> counter = ref.watch(ceremonyProvider); //.stream

    return Scaffold(
      appBar: AppBar(
        title: Text(ceremony),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200.0,
              color: colorList[0],
            ),
            Text(ceremony),
            Text(ceremony),
            Text(ceremony),
            const SizedBox(
              height: 100,
            ),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
