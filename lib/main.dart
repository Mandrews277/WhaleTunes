import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'package:just_audio/just_audio.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

void main() {
  runApp(const WhaleTunes());
}

class WhaleTunes extends StatefulWidget {
  const WhaleTunes({super.key});

  @override
  State<WhaleTunes> createState() => _WhaleTunesState();
}

class _WhaleTunesState extends State<WhaleTunes> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: AudioPlayerPage(
          audioUrl:
              'https://whoicf2.whoi.edu/science/B/whalesounds/WhaleSounds/9220100Z.wav'),
    );
  }
}

class AudioPlayerPage extends StatefulWidget {
  final String audioUrl;

  AudioPlayerPage({required this.audioUrl});

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.audioUrl);
    _audioPlayer.play();
    _configureAmplify();
    listAllWithGuestAccessLevel();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      final storage = AmplifyStorageS3();
      await Amplify.addPlugins([auth, storage]);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  String? nextToken;
  late String Name = '';

  Future<void> listAllWithGuestAccessLevel() async {
    try {
      final result = await Amplify.Storage.list(
        options: const S3ListOptions.listAll(
          accessLevel: StorageAccessLevel.guest,
        ),
      ).result;

      safePrint('Listed items: ${result.items}');
      Name = result.items.toString();
    } on StorageException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Now Playing'),
            StreamBuilder(
              stream: _audioPlayer.durationStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return Text('Loading...');
                }
              },
            ),
            StreamBuilder(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return Text('Loading...');
                }
              },
            ),
            StreamBuilder(
              stream: _audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                } else {
                  return Text('Loading...');
                }
              },
            ),
            Text(Name),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
