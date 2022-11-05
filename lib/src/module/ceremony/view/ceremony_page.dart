import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';
import 'ceremony_event.dart';

final List<String> ceremonyList = <String>['C0', 'C1', 'C2'];

final List<Color> colorList = [
  Colors.deepOrangeAccent,
  Colors.greenAccent,
  Colors.amberAccent,
];

class CeremonyPage extends StatefulWidget {
  const CeremonyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CeremonyPage> createState() => _CeremonyPageState();
}

class _CeremonyPageState extends State<CeremonyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 12,
        ),
        reverse: true,
        padding: const EdgeInsets.all(20),
        itemCount: ceremonyList.length,
        itemBuilder: (context, index) {
          final ceremony = ceremonyList[index];
          return BuildCeremony(ceremony: ceremony);
        },
      ),
    );
  }
}

class BuildCeremony extends ConsumerWidget {
  const BuildCeremony({
    Key? key,
    required this.ceremony,
  }) : super(key: key);

  final String ceremony;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ceremonyProvider = eventProvider;
    final AsyncValue<int> counter = ref.watch(ceremonyProvider);

    return Card(
      elevation: 12,
      borderOnForeground: true,
      shadowColor: colorList[int.parse(ceremony)],
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: colorList[0],
        ),
        trailing: //(counter >= 100)
            //? const Icon(Icons.add_alert) :
            const Icon(Icons.access_alarm_outlined),
        isThreeLine: true,
        title: Text(ceremony),
        subtitle: Text('${ceremony}\nProgress Level:  $counter %'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CeremonyEvent(ceremony: ceremony),
          ));
        },
      ),
    );
  }
}
