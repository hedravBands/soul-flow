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
    return Scaffold(
      body: ListView.builder(
        reverse: true,
        itemCount: sanctumList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.ac_unit_outlined),
            title: Text(sanctumList[index]),
            subtitle: Text(sanctumList[index]),
            enabled: 1 > 0 ? true : false,
            selected: _isSelected[index],
            trailing: IconButton(
              icon: const Icon(Icons.add_alert_outlined),
              onPressed: () {},
            ),
            onLongPress: () {},
            autofocus: true,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: SafeArea(
                        child: Card(
                          child: Column(
                            children: [
                              Text(sanctumList[index]),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Build Sanctum: 100 coins'),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Collect x/150'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Update/Not Activated'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  ;
                },
              );
            },
          );
        },
      ),
    );
  }
}
