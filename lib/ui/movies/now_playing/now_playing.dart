import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_now_playing_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/model/movie/movie_results.dart';
import 'package:page_indicator/page_indicator.dart';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    super.initState();
    nowPlayingListBloc..getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    print("StreamBuilder");

    return StreamBuilder<MovieResponse>(
      stream: nowPlayingListBloc.subject.stream,
      builder: (context, snapshot) {
        print("Snpashot==$snapshot");
        print(snapshot.hasData);
        print(snapshot.error);

        if (snapshot.hasData) {
          print("Snpashot==$snapshot");

          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildNowPlayingWidget(snapshot.data);
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

  Widget _buildNowPlayingWidget(MovieResponse data) {
    Size size = MediaQuery.of(context).size;
    List<MovieResults> movies = data.results;
    if (movies.length == 0) {
      return Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("No Movies")],
        ),
      );
    } else {
      return Container(
        width: size.width,
        height: 200,
        child: PageIndicatorContainer(
          align: IndicatorAlign.bottom,
          shape: IndicatorShape.roundRectangleShape(size: Size(6.0, 4.0)),
          indicatorSpace: 10.0,
          indicatorColor: Colors.blueGrey,
          indicatorSelectorColor: Colors.deepOrangeAccent,
          length: movies.take(5).length,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              Constants.imgUrl + movies[index].backdropPath),
                          fit: BoxFit.fill,
                        )),
                    // child: CachedNetworkImage(
                    //   imageUrl: Constants.imgUrl + movies[index].backdropPath,
                    //   imageBuilder: (context, imageProvider) => Container(
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: imageProvider,
                    //           fit: BoxFit.cover,
                    //           colorFilter: ColorFilter.mode(
                    //               Colors.red, BlendMode.colorBurn)),
                    //     ),
                    //   ),
                    //   placeholder: (context, url) =>
                    //       CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ConfigerBloc().darkModeOn
                                ? Colors.black.withOpacity(1.0)
                                : Colors.white.withOpacity(1.0),
                            ConfigerBloc().darkModeOn
                                ? Colors.black.withOpacity(0.0)
                                : Colors.white.withOpacity(0.0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 0.9]),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Icon(
                        EvaIcons.playCircle,
                        color: ConfigerBloc().darkModeOn
                            ? Colors.white.withOpacity(0.8)
                            : Colors.black.withOpacity(0.8),
                        size: 40,
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 4.4,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          movies[index].title,
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                  )
                ],
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: movies.take(5).length,
          ),
        ),
      );
    }
  }
}
