import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_fetch_api/model/api_controler.dart';

class MyHomepage extends StatelessWidget {
  final ApiModel _apiModel = Get.put(ApiModel());

  MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GetX API Demo'),
      ),
      body: Obx(
        () {
          if (_apiModel.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
              itemCount: _apiModel.productList.length,
              itemBuilder: (context, index) {
                var product = _apiModel.productList[index];
                return Card(
                  shadowColor: Colors.grey,
                  elevation: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.favorite_border)]),
                          Image.network(
                            product.image ?? '',
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.title ?? '',
                            maxLines: 1,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                  ),
                                  onPressed: () {},
                                  child: const Text('BUY')),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Details')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
