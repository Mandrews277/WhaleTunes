import 'package:flutter/material.dart';
import 'package:whaletunes/audiolist/audiolist.dart';
import 'package:whaletunes/login/login.dart';
import 'package:whaletunes/audiolist/audiolist.dart';
import 'package:whaletunes/services/auth.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
          );
        } else if (snapshot.hasData) {
          return audioList();
        } else {
          return const loginScreen();
        }
      },
    );
  }
}
