import 'package:flutter/material.dart';

class BorderedImage extends StatelessWidget {
  final String imagePath;

  const BorderedImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffdad2f9), width: 10), // Adjust width as needed
        borderRadius: BorderRadius.circular(8), // Replace with desired radius
      ),
      child: Image.asset(
        imagePath,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
