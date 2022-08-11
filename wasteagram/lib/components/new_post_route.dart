import 'package:flutter/material.dart';
import '../screens/new_post_screen.dart';

// Simple navigator function to navigate from the Main Screen to the New Post Screen
void newPostRoute(context, image) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NewPostScreen(
        image: image,
      ),
    ),
  );
}
