import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class playScreen extends StatelessWidget {
  final audioUrl;

  playScreen({required this.audioUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AudioPlayerWidget(audioFile: audioUrl),
      ),
    );
  }
}

class _AudioPlayerWidget extends StatelessWidget {
  final audioFile;

  _AudioPlayerWidget({required this.audioFile});

  Future<void> _play() async {
    try {
      //final audioReference = FirebaseStorage.instance.refFromURL(audioUrl);
      //final audioFile = await audioReference.getDownloadURL();
      final audioPlayer = AudioPlayer();
      await audioPlayer.setUrl(audioFile);
      await audioPlayer.play();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: _play,
        ),
      ],
    );
  }
}
