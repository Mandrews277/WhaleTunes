import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:whaletunes/firestore.dart';
import 'package:whaletunes/play/play.dart';

class audioList extends StatelessWidget {
  final _storageRef = FirebaseStorage.instance.ref();
  audioList({super.key});

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
                  onTap: () async {
                    if (snapshot.hasData) {
                      final URL = await _storageRef
                          .child(items[index].fullPath)
                          .getDownloadURL();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => playScreen(audioUrl: URL),
                        ),
                      );
                    } else {}
                    final URL = await _storageRef
                        .child(items[index].fullPath)
                        .getDownloadURL();
                    playScreen(audioUrl: URL);
                    print(URL);
                  },
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
