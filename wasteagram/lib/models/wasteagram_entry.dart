import 'dart:io';

// Abstract the fields of the wasteagram posts

class WasteagramEntry {
  late String date;
  int wastedItems = 0;
  late String latitude;
  late String longitude;
  late String photoURL;
  late int timeStamp;
  late File image;

  setDate(currDate) {
    date = currDate;
  }

  setWastedItems(amount) {
    wastedItems = amount;
  }

  setLatitude(lat) {
    latitude = lat;
  }

  setLongitude(long) {
    longitude = long;
  }

  setURL(url) {
    photoURL = url;
  }

  setTimeStamp(time) {
    timeStamp = time;
  }

  setFile(file) {
    image = file;
  }
}
