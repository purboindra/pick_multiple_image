import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (controller.image.value.path.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum ada gambar'),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () =>
                        controller.pickImage(imageType: 'firstImage'),
                    child: Text('pilih gambar'))
              ],
            );
          }
          return SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.file(
                  controller.image.value,
                  width: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                if (controller.image2.value.path.isEmpty) ...[
                  InkWell(
                    onTap: () => controller.pickImage(imageType: 'secondImage'),
                    child: Container(
                      width: 80,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(
                          Icons.image,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Image.file(
                    controller.image2.value,
                    width: 80,
                  ),
                ],
                if (controller.image2.value.path.isNotEmpty &&
                    controller.image3.value.path.isEmpty) ...[
                  InkWell(
                    onTap: () => controller.pickImage(imageType: 'thirdImage'),
                    child: Container(
                      width: 80,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(
                          Icons.image,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  if (controller.image3.value.path.isNotEmpty)
                    Image.file(
                      controller.image3.value,
                      width: 80,
                    ),
                  const SizedBox(),
                ]
              ],
            ),
          );
        }),
      ),
    );
  }
}
