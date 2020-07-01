import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/ui/required/custom_scafold.dart';

import 'movies/genre_movies/genres.dart';
import 'movies/now_playing/now_playing.dart';
import 'movies/person/person.dart';
import 'movies/top_rated/top_rated.dart';

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
          NowPlaying(),
          GenresScreen(),
          PersonList(),
          TopRatedList()
        ],
      ),
    );
  }
}
