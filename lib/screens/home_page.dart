import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifsc_finder_bank/bloc/ifsc_bloc.dart';
import 'package:ifsc_finder_bank/constants/routes.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _ifsc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal.shade100,
        appBar: NewGradientAppBar(
          title: const Text('BANK FINDER'),
          centerTitle: true,
          gradient: const LinearGradient(
            colors: [
              Colors.cyan,
              Colors.indigo,
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Find Your Bank Details Using IFSC',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Icon(
                          Icons.account_balance,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _ifsc,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter your ifsc code.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String response = await ifscBloc.getBankDetails(_ifsc.text);
                    if (response == "") {
                      await Navigator.of(context)
                          .pushNamed(bankDetailPageRoute);
                    } else {
                      Fluttertoast.showToast(msg: response);
                    }
                    // final isData = await ifscBloc.responseMap;
                    // if (isData != null) {

                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text('invalid')));
                    // }
                  },
                  child: const Text(
                    'Search',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
