import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_details_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/model/movie_details/movie_details_response.dart';
import 'package:flutter_moviedemo/ui/movies/details/movie_details_casts.dart';
import 'package:flutter_moviedemo/ui/movies/similer/similer_movies.dart';
import 'package:flutter_moviedemo/ui/required/title_description.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailsDescription extends StatefulWidget {
  final int moviesID;

  const MovieDetailsDescription({Key key, this.moviesID}) : super(key: key);

  @override
  _MovieDetailsDescriptionState createState() =>
      _MovieDetailsDescriptionState(moviesID);
}

class _MovieDetailsDescriptionState extends State<MovieDetailsDescription> {
  final int moviesID;

  _MovieDetailsDescriptionState(this.moviesID);

  @override
  void initState() {
    super.initState();
    movieDetailsBloc..getMoviesDetails(moviesID);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieDetailsResponse>(
      stream: movieDetailsBloc.subject.stream,
      builder: (context, snapshot) {
        // print("Snpashot==$snapshot");
        // print(snapshot.hasData);
        // print(snapshot.error);

        if (snapshot.hasData) {
          print("Genre_Snpashot==$snapshot");

          // if (snapshot.data.error != null) {
          //   return _buildErrorWidget(snapshot.data.error);
          // }
          return _buildMovieDetailedInfoWidget(snapshot.data);
        } //else if (snapshot.error) {
        //return _buildErrorWidget(snapshot.error);}
        else
          return _buildLoadingWidget();
      },
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

  Widget _buildMovieDetailedInfoWidget(MovieDetailsResponse data) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MovieDetailsCasts(
            id: moviesID,
          ),
          TitleDescWidget(
            title: "Storyline",
            description: data.overview,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Genres",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
              height: 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.genres.length,
                  itemBuilder: (context, index) {
                    return BorderTagWidget(
                      tag: data.genres[index].name,
                    );
                  })),
          SizedBox(
            height: 15,
          ),
          Text(
            "Rating",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: <Widget>[
              RatingBar(
                onRatingUpdate: (rating) => print(rating),
                itemSize: 15.0,
                initialRating: data.voteAverage / 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: true,
                unratedColor:
                    ConfigerBloc().darkModeOn ? Colors.black87 : Colors.grey,
                itemPadding: EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => Icon(
                  EvaIcons.star,
                  //size: 30,
                  color:
                      ConfigerBloc().darkModeOn ? Colors.white : Colors.black,
                ),
              ),
              Text("   (${data.voteAverage})")
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Production Companies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
              height: 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.productionCompanies.length,
                  itemBuilder: (context, index) {
                    return BorderTagWidget(
                      tag: data.productionCompanies[index].name,
                    );
                  })),
          SizedBox(
            height: 15,
          ),
          Text(
            "Production Countries",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
              height: 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.productionCountries.length,
                  itemBuilder: (context, index) {
                    return BorderTagWidget(
                      tag: data.productionCountries[index].name,
                    );
                  })),
          SizedBox(
            height: 15,
          ),
          TitleDescWidget(
              title: "Budget",
              description: "\$" + data.budget.toString() + "(Estimated)"),
          SimilerMovies(
            id: moviesID,
          )
        ],
      ),
    );
  }
}

class BorderTagWidget extends StatelessWidget {
  final String tag;

  const BorderTagWidget({
    Key key,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(left: 7, right: 7),
      decoration: BoxDecoration(
          border: Border.all(
              color: ConfigerBloc().darkModeOn ? Colors.grey : Colors.black38),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          // Image(
          //     width: 100,
          //     height: 40,
          //     image: CachedNetworkImageProvider(
          //       Constants.imgUrlWidth300 +
          //           data.productionCompanies[index].logoPath,
          //     )),
          Text(
            tag,
            style: TextStyle(
                color:
                    ConfigerBloc().darkModeOn ? Colors.grey : Colors.black87),
          ),
        ],
      ),
    );
  }
}


