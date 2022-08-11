import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import '../components/appbars.dart';
import '../components/main_screen_fab.dart';
import '../components/new_post_route.dart';
import '../components/wasteagram.dart';

// The main screen that shows wasteagram entries
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  File? image;
  final picker = ImagePicker();

  // Gets a image from taking a photo with the camera
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null || !mounted) {
      return;
    }
    // Continues if the user allows access to the camera
    image = File(pickedFile.path);
    newPostRoute(context, image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('timeStamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => Wasteagram(
                date: snapshot.data!.docs[index]['date'],
                wastedItems: snapshot.data!.docs[index]['wastedItems'],
                latitude: snapshot.data!.docs[index]['latitude'],
                longitude: snapshot.data!.docs[index]['longitude'],
                timeStamp: snapshot.data!.docs[index]['timeStamp'],
                photoURL: snapshot.data!.docs[index]['photoURL'],
              ),
            );
          }
        },
      ),
      // Leads the route of taking a photo with the camera and creating a new wasteagram post
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Semantics(
          onTapHint: 'Takes a Photo',
          button: true,
          child: MainScreenFab(getImage: getImage)),
    );
  }
}
