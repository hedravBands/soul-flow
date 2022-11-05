import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soulflow/src/module/sanctuary/presentation/view/sanctuary_page.dart';

import '../../../../../main.dart';
import '../../domain/model/sanctum.dart';

class SanctumPage extends ConsumerWidget {
  const SanctumPage({
    Key? key,
    required this.sanctum,
  }) : super(key: key);

  final Sanctum sanctum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sanctumProvider = sanctumProviderList[int.parse(sanctum.id)];
    final int counter = ref.watch(sanctumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(sanctum.name),
        actions: [
          IconButton(
              onPressed: () {
                ref.refresh(sanctumProvider); // or invalidate
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200.0,
              color: colorList[int.parse(sanctum.id)],
            ),
            Text(sanctum.type),
            Text(sanctum.element),
            Text(sanctum.level.toString()),
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(sanctumProvider.notifier).state += 10;
          },
          child: const Icon(Icons.add_alert)),
    );
  }
}
