import 'package:flutter/material.dart';
import '../components/wasteagram_post.dart';

// Initial post layout that's viwed in the Main Screen
class Wasteagram extends StatelessWidget {
  final String date;
  final int wastedItems;
  final String latitude;
  final String longitude;
  final int timeStamp;
  final String photoURL;

  const Wasteagram(
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
    return Semantics(
      hint: 'Click to see the post description',
      child: ListTile(
        leading: Text(date),
        trailing: Text('Wasted Items: $wastedItems'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // Creates a detailed page with the wasteagram's decription and photo
              builder: (context) => WasteagramPost(
                  date: date,
                  wastedItems: wastedItems,
                  latitude: latitude,
                  longitude: longitude,
                  timeStamp: timeStamp,
                  photoURL: photoURL),
            ),
          );
        },
      ),
    );
  }
}
