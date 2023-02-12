import 'package:flutter/material.dart';
import 'package:ifsc_finder_bank/constants/routes.dart';
import 'package:ifsc_finder_bank/screens/bank_detail_page.dart';
import 'package:ifsc_finder_bank/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        homePageRoute: (context) => HomePage(),
        bankDetailPageRoute: (context) => BankDetailPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}
