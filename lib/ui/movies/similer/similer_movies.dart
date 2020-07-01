import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_similer_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/language.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/model/movie/movie_results.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SimilerMovies extends StatefulWidget {
  final int id;

  const SimilerMovies({Key key, this.id}) : super(key: key);

  @override
  _SimilerMoviesState createState() => _SimilerMoviesState(id);
}

class _SimilerMoviesState extends State<SimilerMovies> {
  final int id;

  _SimilerMoviesState(this.id);

  @override
  void initState() {
    super.initState();
    movieSimilerBloc..getSimilerMovies(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: movieSimilerBloc.subject.stream,
      builder: (context, snapshot) {
        // print("GenreMoviesSnpashot==$snapshot");
        // print(snapshot.hasData);
        // print(snapshot.error);

        if (snapshot.hasData) {
          // print("GenreMoviesSnpashot2==$snapshot");
          // print(snapshot.data.results.toString());
          // print(snapshot.data.error);

          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 6, top: 15),
                child: Text(
                  "Similer Movies",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              _buildMoviesSimilerWidget(snapshot.data),
            ],
          );
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

  Widget _buildMoviesSimilerWidget(MovieResponse data) {
    List<MovieResults> movies = data.results;
    LanguageLocal languageLocal = LanguageLocal();
    print(movies[6].originalTitle);
    return movies.length == 0
        ? Center(child: Text("No Data"))
        : Container(
            color: ConfigerBloc().darkModeOn ? Colors.black : Colors.white,
            margin: EdgeInsets.only(right: 5),
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 7, right: 15),
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
                          : Stack(
                              children: <Widget>[
                                Container(
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
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    padding: EdgeInsets.only(right: 5, left: 5),
                                    margin: EdgeInsets.only(
                                        right: 0.2, bottom: 0.2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5)),
                                      color: Colors.red,
                                    ),
                                    child: Text(
                                      languageLocal.getDisplayLanguage(
                                          movies[index]
                                              .originalLanguage)["name"],
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
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
                          // Text(movies[index].originalLanguage),
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
                            itemBuilder: (context, _) => Icon(
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
