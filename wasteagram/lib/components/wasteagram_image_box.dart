import 'package:flutter/material.dart';

// Used for styling the image right after the user takes it
Flexible newPostImage(image, wasteagramEntry) {
  wasteagramEntry.setFile(image);
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: .95,
      heightFactor: .6,
      child: Image.file(image),
    ),
  );
}

// Used to display the Cloud Firestore image in the wasteagram's description
Flexible wasteagramPostImage(photoURL) {
  return Flexible(
    child: FractionallySizedBox(
      widthFactor: .95,
      heightFactor: .7,
      child: Semantics(
        image: true,
        hint: 'The photo uploaded with the post',
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            child: Image.network(photoURL)),
      ),
    ),
  );
}
