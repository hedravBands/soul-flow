import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';
import '../../domain/model/sanctum.dart';
import 'sanctum_page.dart';

final List<Sanctum> sanctumList = <Sanctum>[
  const Sanctum(
    id: '0',
    element: 'Core',
    type: 'Fundamental',
    name: 'Fundamental Core',
    level: 1,
    description: 'Sanctum Fundamental Core',
    info: ['Sanctum', 'Core', 'Fundamental'],
  ),
  const Sanctum(
    id: '1',
    element: 'Earth',
    type: 'Essential',
    name: 'Essential Earth',
    level: 1,
    description: 'Sanctum Essential Earth',
    info: ['Sanctum', 'Earth', 'Essential'],
  ),
  const Sanctum(
    id: '2',
    element: 'Water',
    type: 'Essential',
    name: 'Essential Water',
    level: 1,
    description: 'Sanctum Essential Water',
    info: ['Sanctum', 'Water', 'Essential'],
  ),
  const Sanctum(
    id: '3',
    element: 'Air',
    type: 'Essential',
    name: 'Essential Air',
    level: 1,
    description: 'Sanctum Essential Air',
    info: ['Sanctum', 'Air', 'Essential'],
  ),
  const Sanctum(
    id: '4',
    element: 'Fire',
    type: 'Essential',
    name: 'Essential Fire',
    level: 1,
    description: 'Sanctum Essential Fire',
    info: ['Sanctum', 'Fire', 'Essential'],
  ),
  const Sanctum(
    id: '5',
    element: 'Ether',
    type: 'Sublime',
    name: 'Sublime Ether',
    level: 1,
    description: 'Sanctum Sublime Ether',
    info: ['Sanctum', 'Ether', 'Sublime'],
  ),
];

final List<Color> colorList = [
  Colors.grey,
  Colors.green,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.amber,
  Colors.deepPurpleAccent
];

class SanctuaryPage extends StatefulWidget {
  const SanctuaryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SanctuaryPage> createState() => _SanctuaryPageState();
}

class _SanctuaryPageState extends State<SanctuaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 12,
        ),
        reverse: true,
        padding: const EdgeInsets.all(20),
        itemCount: sanctumList.length,
        itemBuilder: (context, index) {
          final sanctum = sanctumList[index];
          return BuildSanctum(sanctum: sanctum);
        },
      ),
    );
  }
}

class BuildSanctum extends ConsumerWidget {
  const BuildSanctum({
    Key? key,
    required this.sanctum,
  }) : super(key: key);

  final Sanctum sanctum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sanctumProvider = sanctumProviderList[int.parse(sanctum.id)];
    final int counter = ref.watch(sanctumProvider);

    ref.listen<int>(sanctumProvider, (prev, next) {
      if (next >= 100) {
        ref.read(sanctumProvider.notifier).state = 100;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Congratulations!'),
                content: const Text('Activity is now Ready!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // give candy and pop
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    });

    return Card(
      elevation: 12,
      borderOnForeground: true,
      shadowColor: colorList[int.parse(sanctum.id)],
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: colorList[int.parse(sanctum.id)],
        ),
        trailing: counter >= 100
            ? const Icon(Icons.add_alert)
            : const Icon(Icons.access_alarm_outlined),
        isThreeLine: true,
        title: Text(sanctum.name),
        subtitle: Text('${sanctum.description}\nProgress Level:  $counter %'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SanctumPage(sanctum: sanctum),
          ));
        },
      ),
    );
  }
}

//
// child: ListView.builder(
// reverse: true,
// itemCount: sanctumList.length,
// itemBuilder: (context, index) {
// return ListTile(
// leading: const Icon(Icons.ac_unit_outlined),
// title: Text(sanctumList[index]),
// subtitle: Text(sanctumList[index]),
// enabled: 1 > 0 ? true : false,
// selected: _isSelected[index],
// trailing: IconButton(
// icon: const Icon(Icons.add_alert_outlined),
// onPressed: () {},
// ),
// onLongPress: () {},
// autofocus: true,
// onTap: () {
// showModalBottomSheet(
// context: context,
// builder: (context) {
// return SingleChildScrollView(
// controller: ModalScrollController.of(context),
// child: SizedBox(
// height: MediaQuery.of(context).size.height / 2,
// child: SafeArea(
// child: Card(
// child: Column(
// children: [
// Text(sanctumList[index]),
// ElevatedButton(
// onPressed: () {},
// child: Text('Build Sanctum: 100 coins'),
// ),
// Row(
// children: [
// ElevatedButton(
// onPressed: () {},
// child: Text('Collect x/150'),
// ),
// ElevatedButton(
// onPressed: () {},
// child: Text('Update/Not Activated'),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// );
// },
// );
// },
// );
// },
// ),
