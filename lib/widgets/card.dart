import 'package:flutter/material.dart';
import 'package:ifsc_finder_bank/constants/text_style.dart';

Card myCard(
  Color backgroundColor,
  BuildContext context,
  String text, [
  String? apiText,
]) {
  return Card(
    color: Colors.teal.shade300,
    child: Container(
      constraints: const BoxConstraints(minHeight: 70),

      // height: 70,
      // width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${text.toUpperCase()}: ${apiText?.toUpperCase() ?? " "}',
                style: myText(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
