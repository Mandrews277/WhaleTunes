import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:whaletunes/firestore.dart';

class homeScreen extends StatelessWidget {
  final _storageRef = FirebaseStorage.instance.ref();
  homeScreen({super.key});

  Future<ListResult> _listAllItems() async {
    return _storageRef.listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("WhaleTunes"),
      ),
      body: FutureBuilder(
        future: _listAllItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data?.items;
            return ListView.builder(
              itemCount: items?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items![index].name),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
