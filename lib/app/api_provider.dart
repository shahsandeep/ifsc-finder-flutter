import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ifsc_finder_bank/models/ifsc_model.dart';

class ApiProvider {
  Future<IfscModel> getIfscData(String ifsc) async {
    try {
      String ifsUrl = 'https://ifsc.razorpay.com/$ifsc';
      final response = await http.get(
        Uri.parse(ifsUrl),
      );
      var data = jsonDecode(
        response.body.toString(),
      );
      if (response.statusCode == 200) {
        return IfscModel.fromJson(data);
      } else if (response.statusCode == 404) {
        // String data = response.body;
        // String finalString = "";
        // List<String> dataList = data.split("");
        // dataList.removeLast();
        // dataList.removeAt(0);
        // dataList.forEach((element) {
        //   finalString = finalString + element;
        // });

        return IfscModel.error(response.body.replaceAll('"', ""));
      }

      return IfscModel.error('Wrong Ifsc Code');
    } catch (error) {
      print("23 working ${error.toString()}");
      return IfscModel.error(error.toString());
    }
  }
}
