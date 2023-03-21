import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:tnt/files/image_add.dart';
import 'upload_logic.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({Key? key}) : super(key: key);

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  // File? file;
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // final results = await FilePicker.platform.pickFiles(
        //   allowMultiple: false,
        //   type: FileType.custom,
        //   allowedExtensions: ['png', 'jpg', 'jpeg'],
        // );
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: true,
          allowedExtensions: ['png', 'jpg', 'jpeg'],
        );
        if (result == null) return;
        final file = result.files.first;
        openFiles(result.files);

        final newFile = await savePermanently(file);

        print('Old Path: ${file.path}');
        print('New Path: ${newFile.path}');

        // print('Name: ${file.name}');
        // print('Bytes: ${file.bytes}');
        // print('Size: ${file.size}');
        // print('Extension: ${file.extension}');
        // print('Path: ${file.path}');

        // final path = results.files.single.path!;
        // final fileName = results.files.single.path!;
        //
        // storage.uploadFile(path, fileName).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Successful'),),
        // ),
        // );
      },
      child: const Icon(Icons.upload),
    );
  }
  void openFile(PlatformFile file){
    OpenFile.open(file.path!);
  }

  Future<File> savePermanently(PlatformFile file) async{
    if(kIsWeb){
      //for web
      final appStorage = firebase_storage.FirebaseStorage.instance;
      //final newFile = File('${appStorage.path}/${file.name}');
      final newFile = File('places/${file.name}');
      return File(file.path!).copy(newFile.path);

    }
    //final appStorage = await getApplicationDocumentsDirectory();
    final appStorage = firebase_storage.FirebaseStorage.instance;
    //final newFile = File('${appStorage.path}/${file.name}');
    final newFile = File('places/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> FilesPage(
      files: files,
      onOpenedFile: openFile,
    )),);
  }
}
