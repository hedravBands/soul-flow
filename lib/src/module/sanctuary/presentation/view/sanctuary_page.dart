import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../bloc/sanctum_bloc.dart';

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
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (_) => sl<SanctumBloc>(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            context.read<SanctumBloc>().add(
                                  const CreateSanctumEvent(id: 'index'),
                                );
                          },
                          child: const Text('Create Sanctum')),
                      TextButton(
                          onPressed: () {
                            context.read<SanctumBloc>().add(
                                  const DeleteSanctumEvent(id: 'index'),
                                );
                          },
                          child: const Text('Delete Sanctum')),
                    ],
                  ),
                  BlocBuilder<SanctumBloc, SanctumState>(
                      builder: (context, state) {
                    if (state is Empty) {
                      return const Text('Empty State');
                    } else if (state is Loading) {
                      return const CircularProgressIndicator();
                    } else if (state is Loaded) {
                      return const Text('Loaded State');
                    } else if (state is Error) {
                      return const Text('Error State');
                    } else {
                      return const Text('Unexpected State');
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
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
