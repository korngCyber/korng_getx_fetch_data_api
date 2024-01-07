import 'package:get/get.dart';
import 'package:getx_fetch_api/api_new/Api_service.dart';
import 'package:getx_fetch_api/api_new/api_response_model.dart';

class ApiControllerMovie extends GetxController {
  final _api = ApiService();
  var movie= MovieApiModel();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovieData();
  }

  void getMovieData() async {
    try {
      final respon =await _api.fetchDataMovie();
      movie=respon;
      update();
    } catch (e) {
      throw Exception("errror $e");
    }
  }
}
