import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  final Rx<File> _image = File('').obs;
  Rx<File> get image => _image;

  final Rx<File> _image2 = File('').obs;
  Rx<File> get image2 => _image2;

  final Rx<File> _image3 = File('').obs;
  Rx<File> get image3 => _image3;

  final RxList<File> _listImage = <File>[].obs;

  Future<void> pickImage({required String imageType}) async {
    try {
      List<File> tempImg = [];
      if (imageType == 'firstImage') {
        XFile? img = await _picker.pickImage(source: ImageSource.camera);
        _image.value = File(img!.path);
        tempImg.add(_image.value);
      }
      if (imageType == 'secondImage') {
        XFile? img = await _picker.pickImage(source: ImageSource.camera);
        _image2.value = File(img!.path);
        tempImg.add(_image.value);
      }
      if (imageType == 'thirdImage') {
        XFile? img = await _picker.pickImage(source: ImageSource.camera);
        _image3.value = File(img!.path);
        tempImg.add(_image.value);
      }
      for (var element in tempImg) {
        _listImage.add(element);
      }
      log('LIST IMAGE $_listImage');
    } catch (e) {
      log('ERROR $e');
    }
  }
}
