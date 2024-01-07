import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_fetch_api/api_new/controler.dart';

class MyMainScreen extends StatelessWidget {
  MyMainScreen({super.key});
  final _apiControllerMovie = Get.put(ApiControllerMovie());
  final _urlPlus = "https://image.tmdb.org/t/p/w500";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movie APP"),
      ),
      body: GetBuilder<ApiControllerMovie>(builder: (_) {
        return GridView.builder(
          
          itemCount: _apiControllerMovie.movie.results == null
              ? 0
              : _apiControllerMovie.movie.results!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) {
            var mode = _apiControllerMovie.movie.results![index];
            return Card(
              child: Image.network(_urlPlus + mode.posterPath!),
            );
          },
        );
      }),
    );
  }
}
