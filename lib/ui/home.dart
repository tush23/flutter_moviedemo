import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/ui/main/now_playing.dart';
import 'package:flutter_moviedemo/ui/required/custom_scafold.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Constants.app_name,
      body: ListView(
        children: <Widget>[
          NowPlaying()
        ],
      ),
    );
  }
}
