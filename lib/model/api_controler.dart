import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_fetch_api/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiModel extends GetxController {
  RxBool isLoading = true.obs;
  RxList productList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        var decodedBody = jsonDecode(response.body);
        var products =
            decodedBody.map((product) => Product.fromJson(product)).toList();
        productList.assignAll(products);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value=false;
    }
  }
}
