import 'dart:io';

import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  final File image;

  UploadPage({Key key, @required this.image}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState(image);
}

class _UploadPageState extends State<UploadPage> {
  _UploadPageState(image);

  final nameController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사진 업로드'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Image.file(
                widget.image,
                height: 300,
              ),
              Text(
                '업로드할 사진',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '공유자 이름',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 3,
                controller: descController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '사진 설명',
                ),
              ),
              RaisedButton(
                child: Text("업로드"),
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
