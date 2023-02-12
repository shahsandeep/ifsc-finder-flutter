import 'package:flutter/material.dart';
import 'package:ifsc_finder_bank/bloc/ifsc_bloc.dart';

import 'package:ifsc_finder_bank/widgets/appbar.dart';
import 'package:ifsc_finder_bank/widgets/card.dart';

class BankDetailPage extends StatelessWidget {
  BankDetailPage({super.key});

  final List<Color> appBarColor = [
    Colors.cyan,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('BANK FINDER', true, appBarColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: StreamBuilder(
            stream: ifscBloc.responseMap.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      myCard(Colors.teal.shade200, context, 'BANK NAME',
                          '${snapshot.data?.bank}'),
                      const SizedBox(
                        height: 10,
                      ),
                      myCard(Colors.teal.shade200, context, 'BRANCH CODE',
                          '${snapshot.data?.branch}'),
                      const SizedBox(
                        height: 10,
                      ),
                      myCard(Colors.teal.shade200, context, 'IFSC',
                          '${snapshot.data?.ifsc}'),
                      const SizedBox(
                        height: 10,
                      ),
                      myCard(Colors.teal.shade200, context, 'CITY',
                          '${snapshot.data?.city}'),
                      const SizedBox(
                        height: 10,
                      ),
                      myCard(Colors.teal.shade200, context, 'ADDRESS',
                          '${snapshot.data?.address}'),
                      const SizedBox(
                        height: 10,
                      ),
                      myCard(Colors.teal.shade200, context, 'STATE',
                          '${snapshot.data?.state}'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Search Again'),
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
        ),
      ),
    );
  }
}
