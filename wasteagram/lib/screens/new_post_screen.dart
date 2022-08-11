import 'package:flutter/material.dart';
import 'dart:io';

import '../components/appbars.dart';
import '../components/new_post_form.dart';
import '../components/wasteagram_image_box.dart';
import '../components/new_post_form_fab.dart';
import '../models/wasteagram_entry.dart';

// The screen where a new post is generated
class NewPostScreen extends StatefulWidget {
  final File? image;

  const NewPostScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  // Initialize a Wasteagram model that abstracts the user input from the firestore db
  WasteagramEntry wasteagramEntry = WasteagramEntry();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: postAppBar(context, 'New Post'),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            children: [
              // Image display that the user just took
              newPostImage(widget.image, wasteagramEntry),
              // Form to enter waste amount
              NewPostForm(formKey: formKey, wasteagramEntry: wasteagramEntry),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Semantics(
        button: true,
        onTapHint: 'Tap to upload a new post',
        child: NewPostFab(
          formKey: formKey,
          wasteagramEntry: wasteagramEntry,
        ),
      ),
    );
  }
}
