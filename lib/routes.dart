import 'package:whaletunes/audiolist/audiolist.dart';
import 'package:whaletunes/home/home.dart';
import 'package:whaletunes/login/login.dart';
import 'package:whaletunes/play/play.dart';

var appRoutes = {
  '/': (context) => homeScreen(),
  '/login': (context) => const loginScreen(),
  '/audiolist': (context) => audioList(),
  //'/play': (context) => playScreen(audioUrl: URL),
};
