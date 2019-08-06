import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final DocumentSnapshot snapshot;

  DetailPage({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'images/loading.gif',
                image: snapshot['imageUrl'],
                height: 300,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: snapshot['name'],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                enabled: false,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: snapshot['description'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
