import 'package:flutter/material.dart';

import '../models/models.dart';

class ImageCardField extends StatefulWidget {
  const ImageCardField({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<ImageCardField> createState() => _ImageCardFieldState();
}

class _ImageCardFieldState extends State<ImageCardField> {
  @override
  Widget build(BuildContext context) {
    print("Rebuild ImageCardField");
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: FadeInImage(
        width: double.infinity,
        height: 200,
        fadeInDuration: const Duration(milliseconds: 500),
        fadeOutDuration: const Duration(milliseconds: 100),
        placeholder: const AssetImage('assets/gifs/loading.gif'),
        image: AssetImage(widget.category.backgroundImage),
        fit: BoxFit.cover,
      ),
    );
  }
}