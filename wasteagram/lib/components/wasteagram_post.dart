import 'package:flutter/material.dart';

import '../components/appbars.dart';
import '../components/wasteagram_image_box.dart';

// The detailed view after clicking on a wasteagram post from the Main Screen
class WasteagramPost extends StatelessWidget {
  final String date;
  final int wastedItems;
  final String latitude;
  final String longitude;
  final int timeStamp;
  final String photoURL;

  const WasteagramPost(
      {Key? key,
      required this.date,
      required this.wastedItems,
      required this.latitude,
      required this.longitude,
      required this.timeStamp,
      required this.photoURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: postAppBar(context, 'wasteagram'),
      body: Center(
        child: Column(
          // Incorpates the date of the wasteagram post, photo, waste amount, location and semantics to describe them
          children: [
            Semantics(
              readOnly: true,
              hint: 'The date of the post',
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Text(date, style: const TextStyle(fontSize: 20.0))),
            ),
            wasteagramPostImage(photoURL),
            Semantics(
              hint: 'The amount of waste',
              readOnly: true,
              child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Text(
                    '$wastedItems',
                    style: const TextStyle(fontSize: 20.0),
                  )),
            ),
            Semantics(
              hint: 'The location where the post was entered',
              readOnly: true,
              child: Container(
                  margin: const EdgeInsets.only(top: 60.0),
                  child: Text('( Location: $latitude, $longitude )',
                      style: const TextStyle(fontSize: 16.0))),
            )
          ],
        ),
      ),
    );
  }
}
