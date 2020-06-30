import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_genre_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/genre/genre_response.dart';
import 'package:flutter_moviedemo/model/genre/genre_result.dart';
import 'package:flutter_moviedemo/ui/main/genre_list.dart';

class GenresScreen extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  @override
  void initState() {
    super.initState();
    genreListBloc..getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genreListBloc.subject.stream,
      builder: (context, snapshot) {
        print("Snpashot==$snapshot");
        print(snapshot.hasData);
        print(snapshot.error);

        if (snapshot.hasData) {
          print("Genre_Snpashot==$snapshot");

          if (snapshot.data.error != null) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildGenreWidget(snapshot.data);
        } //else if (snapshot.error) {
        //return _buildErrorWidget(snapshot.error);}
        else
          return _buildLoadingWidget();
      },
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(Constants.someErrorText)],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 40,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
                ConfigerBloc().darkModeOn ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreWidget(GenreResponse data) {
    List<GenresResults> genres = data.genres;
    Size size = MediaQuery
        .of(context)
        .size;
    return genres == null
        ? Text("No Genres")
        : GenresList(
      genre: genres,
    );
  }
}
