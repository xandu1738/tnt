import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagesList extends StatefulWidget {
  const ImagesList({Key? key}) : super(key: key);

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  void getFirebaseImageFolder() {
    final storageRef = FirebaseStorage.instance.ref().child('Gallery').child('Images');
    final listResult = storageRef.listAll().then((result) {
      print("result is $result");
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      //child: getFirebaseImageFolder(),
    );
  }
}