import 'package:flutter/material.dart';

// Allows the user to take a photo with the camera
class MainScreenFab extends StatelessWidget {
  final Function getImage;

  const MainScreenFab({Key? key, required this.getImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        getImage();
      },
      child: const Icon(Icons.camera_alt),
    );
  }
}
