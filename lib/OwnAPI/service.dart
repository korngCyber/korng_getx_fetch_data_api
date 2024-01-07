
import 'dart:convert';
import 'package:getx_fetch_api/OwnAPI/model.dart';
import 'package:http/http.dart' as http;

class ApiServiceOwn {
  Future<OwnModel> fetchDataOwn() async {
    try {
      final url = Uri.parse("http://10.0.2.2:8000/api/post");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return OwnModel.fromJson(data);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
