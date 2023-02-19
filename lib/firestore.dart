import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageList {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<ListResult> _listAllItems() async {
    return _storageRef.listAll();
  }
}
