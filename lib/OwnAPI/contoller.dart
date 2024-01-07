
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_fetch_api/OwnAPI/service.dart';
import 'model.dart';

class ApiControllerOwn extends GetxController {
  final _api = ApiServiceOwn();
  var product = OwnModel();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      final response = await _api.fetchDataOwn();
      product = response;
      update();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
