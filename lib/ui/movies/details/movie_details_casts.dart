import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_cast_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/cast/cast_response.dart';
import 'package:flutter_moviedemo/model/cast/cast_results.dart';
import 'package:flutter_moviedemo/ui/people/profile.dart';

class MovieDetailsCasts extends StatefulWidget {
  final int id;

  const MovieDetailsCasts({Key key, this.id}) : super(key: key);

  @override
  _MovieDetailsCastsState createState() => _MovieDetailsCastsState(id);
}

class _MovieDetailsCastsState extends State<MovieDetailsCasts> {
  final int id;

  _MovieDetailsCastsState(this.id);

  @override
  void initState() {
    super.initState();
    castBloc.getCasts(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Casts",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(left: 10, bottom: 10),
          ),
          StreamBuilder<CastResponse>(
            stream: castBloc.subject.stream,
            builder: (context, snapshot) {
              // print("Snpashot==$snapshot");
              // print(snapshot.hasData);
              // print(snapshot.error);

              if (snapshot.hasData) {
                print("Genre_Snpashot==$snapshot");

                // if (snapshot.data.error != null) {
                //   return _buildErrorWidget(snapshot.data.error);
                // }
                return _buildMovieDetailedCastWidget(snapshot.data);
              } //else if (snapshot.error) {
              //return _buildErrorWidget(snapshot.error);}
              else
                return _buildLoadingWidget();
            },
          ),
        ],
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

  Widget _buildMovieDetailedCastWidget(CastResponse data) {
    List<Cast> cast = data.cast;
    return Container(
      height: 110,
      child: ListView.builder(
          itemCount: cast.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(right: 18),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(
                                personId: cast[index].id,
                              )));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(right: 15),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  Constants.imgUrlWidth300 +
                                      cast[index].profilePath),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      cast[index].name,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      cast[index].character,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
