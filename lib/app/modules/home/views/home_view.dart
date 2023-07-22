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
      body: Obx(
        () {
          if (controller.listImages.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum ada gambar'),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async => await controller.pickImages(),
                      child: Text('pilih gambar'))
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listImages.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 100,
                            child: Stack(
                              children: [
                                Image.file(
                                  controller.listImages[index],
                                ),
                                Positioned(
                                  top: 5,
                                  right: 10,
                                  child: InkWell(
                                    onTap: () => controller.removeImage(index),
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (controller.listImages.length <= 2)
                        InkWell(
                          onTap: () async => await controller.pickImages(),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey,
                            child: Center(
                              child: Icon(
                                Icons.image,
                                size: 24,
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (controller.listImages.isNotEmpty)
                Expanded(
                    child: Text(
                        'Anda telah memilih ${controller.listImages.length} / 3')),
            ],
          );
        },
      ),
    );
  }
}
