import 'dart:io';
import 'dart:io' show File;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';

class UploadPage extends StatefulWidget {
  final String imageCategory;
  final String collection;
  const UploadPage({Key? key, required this.imageCategory, required this.collection}) : super(key: key);

  @override
  UploadPageState createState() => UploadPageState();
}

class UploadPageState extends State<UploadPage> {
  List<Widget> itemPhotosWidgetList = <Widget>[];

  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];

  List<String> downloadUrl = <String>[];

  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width,
        screenheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 480) {
        return displayPhoneUploadFormScreen(screenwidth, screenheight);
      } else {
        return displayWebUploadFormScreen(screenwidth, screenheight);
      }
    });
  }

  displayPhoneUploadFormScreen(screenwidth, screenheight) {
    return Container();
  }

  displayWebUploadFormScreen(screenwidth, screenheight) {
    return OKToast(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade100,
            ),
            width: screenwidth * 0.7,
            height: 300.0,
            child: Center(
              child: itemPhotosWidgetList.isEmpty
                  ? Center(
                      child: MaterialButton(
                        onPressed: pickPhotoFromGallery,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              color: Colors.black,
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        spacing: 5.0,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: 10.0,
                        children: itemPhotosWidgetList,
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 100.0,
                  right: 100.0,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.green;
                        }
                        return Colors.redAccent;
                      },
                    ),
                  ),
                  onPressed: uploading ? null : () => upload(),
                  child: uploading
                      ? const SizedBox(
                          height: 10.0,
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          "add",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  addImage() {
    for (var bytes in photo!) {
      itemPhotosWidgetList.add(
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: SizedBox(
            height: 90.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: kIsWeb
                    ? Image.network(File(bytes.path).path)
                    : Image.file(
                        File(bytes.path),
                      ),
              ),
            ),
          ),
        ),
      );
    }
  }

  pickPhotoFromGallery() async {
    photo = await _picker.pickMultiImage();
    if (photo != null) {
      setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });
    }
  }

  upload() async {
    String productId = await uploadImageAndSaveItemInfo();
    setState(() {
      uploading = false;
    });
    showToast("Image Uploaded Successfully");
  }

  Future<String> uploadImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    // String? productId = const Uuid().v4();
    String category = widget.imageCategory;

    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);

      await uploadImageToStorage(pickedFile, category);
    }
    return category;
  }

  uploadImageToStorage(PickedFile? pickedFile, String category) async {
    String? pId = const Uuid().v4();
    Reference reference =
        FirebaseStorage.instance.ref().child('$category/places_$pId');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/png'),
    );
    String value = await reference.getDownloadURL();
    downloadUrl.add(value);
    await FirebaseFirestore.instance.collection(widget.collection).add({
      'url': downloadUrl,
      'name': pId,
    });
  }

  // loadImages() async {
  //   List<Map<String, dynamic>> files = [];
  //   final ListResult result = await FirebaseStorage.instance.ref().list();
  //   final List<Reference> allFiles = result.items;

  //   await Future.forEach<Reference>(allFiles, (file) async {
  //     final String fileUrl = await file.getDownloadURL();
  //     //final FullMetadata fileMeta = await file.getMetadata();
  //     files.add({
  //       "url": fileUrl,
  //       "path": file.fullPath,
  //     });
  //   });

  //   return files;
  // }

}
