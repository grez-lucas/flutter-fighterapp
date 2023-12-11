import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';
import "dart:io";
import 'app_widgets.dart';

class ImageForm extends StatelessWidget {
  ImageForm({
    super.key,
    required this.categoryNotifier,
    required this.formValues,
  });

  final ValueNotifier<CategoryModel> categoryNotifier;
  final ValueNotifier<String> imageNotifier = ValueNotifier<String>('');
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ValueListenableBuilder(
        valueListenable: categoryNotifier,
        builder: (context, CategoryModel value, child) {
          return ImageCardField(category: value);
        },
      ),
      Positioned(
        top: 50,
        right: 110,
        child: ValueListenableBuilder(
            valueListenable: imageNotifier,
            builder: (context, value, child) {
              return formValues['image'] == null
                  ? const Image(
                      image: AssetImage("assets/icons/no-image.jpg"),
                      width: 100,
                      height: 100,
                    )
                  : Image.file(
                      File(formValues['image']),
                      width: 100,
                      fit: BoxFit.cover,
                    );
            }),
      ),
      Positioned(
        bottom: 15,
        right: 20,
        child: IconButton(
          icon: const Icon(Icons.camera_alt_outlined,
              color: Colors.white, size: 35),
          onPressed: () async {
            print('Camera button clicked');

            final picker = ImagePicker();
            final XFile? pickedFile = await picker.pickImage(
                source: ImageSource.camera, imageQuality: 100);

            if (pickedFile == null) {
              print("We don't have a file");
              return;
            }

            print("We have a file at ${pickedFile.path}");
            formValues['image'] = pickedFile.path;
            imageNotifier.value = pickedFile.path;
          },
        ),
      )
    ]);
  }
}
