import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_pic/src/map_page.dart';
import 'package:flutter_share_pic/src/upload_page.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatelessWidget {
  Future<File> getImage() {
    return ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future _uploadImage(file) async {
    final StorageReference storageReference =
        FirebaseStorage().ref().child('images/abcd.jpg');
    final StorageUploadTask uploadTask = storageReference.putFile(file);

    if (uploadTask.isComplete) {
      if (uploadTask.isSuccessful) {
        print('successful');
      } else if (uploadTask.isCanceled) {
        print('canceled');
      }
    } else if (uploadTask.isInProgress) {
      print('uploading');
    }

    return storageReference.getDownloadURL();
  }

  _moveUploadPage(file) {

  }

  @override
  Widget build(BuildContext context) {
    Future<void> _askedToLead() async {
      switch (await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('사진 업로드'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 'pick');
                  },
                  child: const Text('사진선택'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 'take');
                  },
                  child: const Text('사진찍기'),
                ),
              ],
            );
          })) {
        case 'pick':
          var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//          var uri = await _uploadImage(image);
          print(image);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadPage(image: image),
            ),
          );
          break;
        case 'take':
          var image = await ImagePicker.pickImage(source: ImageSource.camera);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadPage(image: image),
            ),
          );
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('사진 공유 앱'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("사진 업로드"),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {
                _askedToLead();
              },
            ),
            RaisedButton(
              child: Text("공유사진 보기"),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
