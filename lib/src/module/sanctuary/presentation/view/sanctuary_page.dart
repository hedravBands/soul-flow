import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final List<String> sanctumList = <String>[
  'S1 L1 Core',
  'S2 L2 Earth',
  'S3 L3 Water',
  'S4 L4 Wind',
  'S5 L5 Fire',
  'S6 L6 Ether'
];

final List<bool> _isSelected = List.generate(sanctumList.length, (i) => false);

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
    return const Scaffold(
      body: SafeArea(child: buildListView()),
    );
  }
}

class buildListView extends StatelessWidget {
  const buildListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: sanctumList.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return buildListTile(index: index);
        },
      ),
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
    return Center(
      child: ListTile(
        leading: const Icon(Icons.ac_unit_outlined),
        title: Text(sanctumList[index]),
        subtitle: Text(sanctumList[index]),
        enabled: 1 > 0 ? true : false,
        selected: _isSelected[index],
        trailing: IconButton(
          icon: const Icon(Icons.add_alert_outlined),
          onPressed: () {},
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return buildScrollViewOnTap(index: index);
            },
          );
        },
        onLongPress: () {},
      ),
    );
  }
}

class buildScrollViewOnTap extends StatefulWidget {
  const buildScrollViewOnTap({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<buildScrollViewOnTap> createState() => _buildScrollViewOnTapState();
}

class _buildScrollViewOnTapState extends State<buildScrollViewOnTap> {
  @override
  Widget build(BuildContext context) {
    setState(() => _isSelected[widget.index] = false);
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: SafeArea(
          child: Card(
            child: Column(
              children: [
                Text(sanctumList[widget.index]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// class buildBottomSheet extends StatelessWidget {
//   final int index;
//   const buildBottomSheet({
//     Key? key,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return showMaterialModalBottomSheet(
//       context: context,
//       builder: (context) => SingleChildScrollView(
//       controller: ModalScrollController.of(context),
//         child: ListTile(
//           leading: Icon(Icons.ac_unit_outlined),
//           title: Text(sanctumList[index]),
//           subtitle: Text(sanctumList[index]),
//           enabled: 1 > 0 ? true : false,
//           selected: index == 3 ? true : false,
//           trailing: IconButton(
//             icon: Icon(Icons.add_alert_outlined),
//             onPressed: () {},
//           ),
//           onTap: () {},
//           onLongPress: () {},
//         ),),
//
//     );
//   }
