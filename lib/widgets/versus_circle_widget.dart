import 'package:flutter/material.dart';

class VSCircle extends StatelessWidget {
  const VSCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: const Center(
          child: Text(
            "VS",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

