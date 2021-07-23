import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({Key? key, required this.onImageSelected}) : super(key: key);
  final Function(File) onImageSelected;
  final ImagePicker _picker = ImagePicker();
  void imageSelected(PickedFile? image) async {
    if (image != null) {
      File? croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        maxHeight: 100,
        maxWidth: 100,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
      );
      onImageSelected(croppedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: () async {
              PickedFile? image =
                  await _picker.getImage(source: ImageSource.camera);
              imageSelected(image);
            },
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () async {
              PickedFile? image =
                  await _picker.getImage(source: ImageSource.gallery);
              imageSelected(image);
            },
            child: Text('Galeria'),
          ),
        ],
      ),
    );
  }
}
