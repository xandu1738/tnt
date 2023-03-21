import 'dart:html';
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';
class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<fb.UploadTaskSnapshot>(
          stream: _uploadTask?.onStateChanged,
          builder: (context, snapshot) {
            final event = snapshot.data;

            // Default as 0
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalBytes * 100
                : 0;

            if (progressPercent == 100) {
              return const Text('Successfully uploaded file 🎊');
            } else if (progressPercent == 0) {
              return const SizedBox();
            } else {
              return LinearProgressIndicator(
                value: progressPercent,
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'picker',
          elevation: 0,
          backgroundColor: Colors.tealAccent[400],
          hoverElevation: 0,
          label: Row(
            children: const <Widget>[
              Icon(Icons.file_upload),
              SizedBox(width: 10),
              Text('Upload Image')
            ],
          ),
          onPressed: () => uploadImage(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  /// A "select file/folder" window will appear. User will have to choose a file.
  /// This file will be then read, and uploaded to firebase storage;
  uploadImage() async {
    // HTML input element
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
          (changeEvent) {
        final file = uploadInput.files!.first;
        final reader = FileReader();

        reader.readAsDataUrl(file);

        reader.onLoadEnd.listen(
          // After file finiesh reading and loading, it will be uploaded to firebase storage
              (loadEndEvent) async {
            uploadToFirebase(file);
          },
        );
      },
    );
  }
  fb.UploadTask? _uploadTask;

  uploadToFirebase(File imageFile) async {
    final filePath = 'places/${DateTime.now()}.png';
    setState(() {
      _uploadTask = fb
          .storage()
          .refFromURL('gs://tnt-firebase-1738.appspot.com')
          .child(filePath)
          .put(imageFile);
    });
  }
}
