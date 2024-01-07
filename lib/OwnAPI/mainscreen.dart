import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contoller.dart';
class MyMainAPIOwn extends StatelessWidget {
  const MyMainAPIOwn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _apiControllerown = Get.put(ApiControllerOwn());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Own API APP"),
      ),
      body: GetBuilder<ApiControllerOwn>(builder: (_) {
        return GridView.builder(
          itemCount: _apiControllerown.product.data == null
              ? 0
              : _apiControllerown.product.data!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 300,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            var model = _apiControllerown.product.data![index];
            return Card(
              child: model.image != null
                  ? Image.network(
                      model.image!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      // You can customize the placeholder or handle the null case
                      child: Text("No Image"),
                    ),
            );
          },
        );
      }),
    );
  }
}
