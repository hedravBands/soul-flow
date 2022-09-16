import 'package:flutter/material.dart';

final List<String> sanctumList = <String>[
  'S1 L1 Core',
  'S2 L2 Earth',
  'S3 L3 Water',
  'S4 L4 Wind',
  'S5 L5 Fire',
  'S6 L6 Ether'
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
      body: buildListView(),
    );
  }
}

class buildListView extends StatelessWidget {
  const buildListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sanctumList.length,
      reverse: true,
      itemBuilder: (BuildContext context, int index) =>
          buildListTile(index: index),
    );
  }
}

class buildListTile extends StatelessWidget {
  final int index;
  const buildListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0.5, vertical: 0.9),
      leading: Icon(Icons.ac_unit_outlined),
      title: Text(sanctumList[index]),
      subtitle: Text(
          sanctumList[index] + '\n' + 'Third Line Activated here with \\n'),
      isThreeLine: true,
      enabled: 1 > 0 ? true : false,
      selected: index == 3 ? true : false,
      trailing: IconButton(
        icon: Icon(Icons.add_alert_outlined),
        onPressed: () {},
      ),
      onTap: () {},
      onLongPress: () {},
    );
  }
}
