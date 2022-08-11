import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/get_date.dart';

// Most of the logic to upload the data to Firestore and the image to the cloud is here
void addNewEntry(wasteagramEntry) async {
  Location locationService = Location();

  // Manually checks for location services
  var serviceEnabled = await locationService.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await locationService.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  var permissionGranted = await locationService.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await locationService.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  // Uploading the image to the Cloud and getting the url back
  var fileName = '${DateTime.now()}.jpg';
  Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
  UploadTask uploadTask = storageReference.putFile(wasteagramEntry.image);
  await uploadTask;
  final url = await storageReference.getDownloadURL();

  // Updating the fields to the model that abstracts wasteagram posts
  final locationData = await locationService.getLocation();
  wasteagramEntry.setLatitude(locationData.latitude.toString());
  wasteagramEntry.setLongitude(locationData.longitude.toString());
  wasteagramEntry.setDate(getCurrentDate());
  wasteagramEntry.setURL(url);
  wasteagramEntry.setTimeStamp(getTimeStamp());

  // Uploading the data from the model to the actual firestore db
  FirebaseFirestore.instance.collection('posts').add({
    'date': wasteagramEntry.date,
    'wastedItems': wasteagramEntry.wastedItems,
    'latitude': wasteagramEntry.latitude,
    'longitude': wasteagramEntry.longitude,
    'timeStamp': wasteagramEntry.timeStamp,
    'photoURL': wasteagramEntry.photoURL,
  });
}
