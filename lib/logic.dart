import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Save {
  void write(String name, String abt, String no) {
    print(name);
    print(abt);
    print(no);
  }
}

class Inimage {
  var picker;
  var ima = File('lib\assets\bumblebee.jpg');
  im() async {
    picker = new ImagePicker();
    final getFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    print('Done');
    return getFile;
  }

  // input() {
  //   return ima;
  // }
}
