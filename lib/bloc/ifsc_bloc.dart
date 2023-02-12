import 'package:ifsc_finder_bank/app/api_provider.dart';
import 'package:ifsc_finder_bank/models/ifsc_model.dart';
import 'package:rxdart/rxdart.dart';

class IfscBloc {
  final ApiProvider _apiProvider = ApiProvider();
  bool isError = false;

  final BehaviorSubject<IfscModel> _responseMap = BehaviorSubject<IfscModel>();

  Future<String> getBankDetails(String ifsc) async {
    IfscModel response = await _apiProvider.getIfscData(ifsc);
    if (response.error == null) {
      _responseMap.sink.add(response);
      return "";
    }
    // Fluttertoast.showToast(msg: response.error ?? "");
    return response.error ?? "";
  }

  setBankDetals(IfscModel data) {
    _responseMap.sink.add(data);
  }

  BehaviorSubject<IfscModel> get responseMap => _responseMap;
}

IfscBloc ifscBloc = IfscBloc();
