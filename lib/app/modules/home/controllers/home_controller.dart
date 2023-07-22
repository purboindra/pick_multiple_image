import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final RxList<File> listImages = <File>[].obs;

  void removeImage(int index) {
    listImages.removeAt(index);
  }

  Future<void> pickImages() async {
    try {
      XFile? images = await _picker.pickImage(source: ImageSource.camera);
      listImages.add(File(images!.path));
    } catch (e) {
      log('ERRO PICK IMAGES $e');
    }
  }
}
