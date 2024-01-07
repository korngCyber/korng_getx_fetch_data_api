import 'dart:convert';

import 'package:getx_fetch_api/api_new/api_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<MovieApiModel> fetchDataMovie() async {
    try {
      final url = Uri.parse(
          "https://api.themoviedb.org/3/movie/popular?api_key=2ad37b2fdbe3ee0ecd160cf9fb0ff120");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return MovieApiModel.fromJson(data);
      } else {
        throw Exception("error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
