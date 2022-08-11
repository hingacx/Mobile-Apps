import 'package:flutter/material.dart';

import '../models/wasteagram_entry.dart';
import '../components/add_post.dart';

// The FAB that submits the new post form
class NewPostFab extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final WasteagramEntry wasteagramEntry;

  const NewPostFab({
    Key? key,
    required this.formKey,
    required this.wasteagramEntry,
  }) : super(key: key);

  @override
  State<NewPostFab> createState() => _NewPostFabState();
}

class _NewPostFabState extends State<NewPostFab> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: .15,
      child: FloatingActionButton(
        onPressed: () {
          if (widget.formKey.currentState!.validate()) {
            widget.formKey.currentState?.save();
            addNewEntry(widget.wasteagramEntry);
            Navigator.of(context).pop();
          }
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: const Icon(Icons.cloud_upload, size: 30),
      ),
    );
  }
}
