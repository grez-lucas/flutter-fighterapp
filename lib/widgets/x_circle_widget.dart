import 'package:flutter/material.dart';

class XCircle extends StatelessWidget {
  const XCircle({
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
        child: Center(
            child: Icon(
          Icons.clear,
          color: Colors.redAccent[700],
          size: 30,
        )),
      ),
    );
  }
}
