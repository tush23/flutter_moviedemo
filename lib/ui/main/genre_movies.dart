import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movies_bygenre_bloc.dart';
import 'package:flutter_moviedemo/configer/configer_bloc.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/model/movie/movie_results.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GenreMovies extends StatefulWidget {
  final int genreId;

  const GenreMovies({Key key, this.genreId}) : super(key: key);
  @override
  _GenreMoviesState createState() => _GenreMoviesState(genreId);
}

class _GenreMoviesState extends State<GenreMovies> {
  final int genreId;
  _GenreMoviesState(this.genreId);

  @override
  void initState() {
    super.initState();
    moviesListByGenreBloc..getMoviesByGenres(genreId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: moviesListByGenreBloc.subject.stream,
      builder: (context, snapshot) {
        print("GenreMoviesSnpashot==$snapshot");
        print(snapshot.hasData);
        print(snapshot.error);

        if (snapshot.hasData) {
          print("GenreMoviesSnpashot2==$snapshot");
          print(snapshot.data.results.toString());
          print(snapshot.data.error);

          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildMoviesByGenreWidget(snapshot.data);
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

  Widget _buildMoviesByGenreWidget(MovieResponse data) {
    List<MovieResults> movies = data.results;
    print(movies[6].originalTitle);
    return movies.length == 0
        ? Center(child: Text("No Data"))
        : Container(
      color: ConfigerBloc().darkModeOn ? Colors.black : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                movies[index].posterPath == null
                    ? Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        EvaIcons.filmOutline,
                        size: 40,
                      ),
                    ],
                  ),
                )
                    : Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            Constants.imgUrlWidth200 +
                                movies[index].posterPath,
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 120,
                  child: Text(
                    movies[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Text(movies[index].voteAverage.toString()),
                    SizedBox(
                      width: 30,
                    ),
                    RatingBar(
                      onRatingUpdate: (rating) => print(rating),
                      itemSize: 10.0,
                      initialRating: movies[index].voteAverage / 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      glow: true,
                      unratedColor: ConfigerBloc().darkModeOn
                          ? Colors.black87
                          : Colors.grey,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) =>
                          Icon(
                            EvaIcons.star,
                            color: ConfigerBloc().darkModeOn
                                ? Colors.white
                                : Colors.black,
                          ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
