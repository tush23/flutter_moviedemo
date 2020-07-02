import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_details_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/movie/movie_results.dart';
import 'package:flutter_moviedemo/model/movie_details/movie_details_response.dart';
import 'package:flutter_moviedemo/ui/movies/details/movie_details_desc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sliver_fab/sliver_fab.dart';

class MovieDetail extends StatefulWidget {
  final MovieResults movies;

  const MovieDetail({Key key, this.movies}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState(movies);
}

class _MovieDetailState extends State<MovieDetail> {
  final MovieResults movies;

  _MovieDetailState(this.movies);

  Color paletteColor = Colors.yellow;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    movieDetailsBloc..getMoviesDetails(movies.id);

    getImagePalette(
        CachedNetworkImageProvider(Constants.imgUrl + movies.posterPath));
  }

  getImagePalette(ImageProvider imageProvider) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
    paletteColor = paletteGenerator.dominantColor.color;
    setState(() {
      paletteColor = paletteGenerator.mutedColor.color;
    });
  }

  @override
  void dispose() {
    super.dispose();
    movieDetailsBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConfigerBloc().darkModeOn ? Colors.black : Colors.white,
      body: Builder(builder: (context) {
        return SliverFab(
          expandedHeight: 500,
          floatingPosition: FloatingPosition(top: 30, right: size.width / 7),
          floatingWidget: StreamBuilder<MovieDetailsResponse>(
            stream: movieDetailsBloc.subject.stream,
            builder: (context, snapshot) {
              // print("Snpashot==$snapshot");
              // print(snapshot.hasData);
              // print(snapshot.error);

              if (snapshot.hasData) {
                print("MovieDetail Snpashot==$snapshot");

                // if (snapshot.data.error != null && snapshot.data.error.length > 0) {
                //   return _buildErrorWidget(snapshot.data.error);
                // }
                return _buildDetailsWidget(snapshot.data);
              } //else if (snapshot.error) {
              //return _buildErrorWidget(snapshot.error);}
              else
                return _buildLoadingWidget();
            },
          ),
          slivers: <Widget>[
            SliverAppBar(
              brightness: ConfigerBloc().darkModeOn
                  ? Brightness.dark
                  : Brightness.light,
              pinned: true,
              stretch: true,
              //floating: true,
              expandedHeight: 490,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(top: 7, bottom: 5),
                title: Container(
                  width: size.width / 2,
                  child: Text(
                    movies.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                centerTitle: true,
                background: Stack(
                  children: <Widget>[
                    Container(
                      height: 460,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  Constants.imgUrl + movies.posterPath),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height / 14),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            ConfigerBloc().darkModeOn
                                ? Colors.black.withOpacity(0.9)
                                : Colors.white.withOpacity(0.9),
                            ConfigerBloc().darkModeOn
                                ? Colors.black.withOpacity(0.0)
                                : Colors.white.withOpacity(0.0)
                          ], begin: Alignment.bottomCenter, end: Alignment.center)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height / 14),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                ConfigerBloc().darkModeOn
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                                ConfigerBloc().darkModeOn
                                    ? Colors.black.withOpacity(0.0)
                                    : Colors.white.withOpacity(0.0)
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.centerRight)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height / 14),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                ConfigerBloc().darkModeOn
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                                ConfigerBloc().darkModeOn
                                    ? Colors.black.withOpacity(0.0)
                                    : Colors.white.withOpacity(0.0)
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.centerLeft)),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 6, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MovieDetailsDescription(
                        moviesID: movies.id,
                      )
                    ],
                  ),
                )
              ])),
            )
          ],
        );
      }),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(error)],
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

  Widget _buildDetailsWidget(MovieDetailsResponse data) {
    return Container(
      width: 300,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(data.tagline),
          SizedBox(
            height: 7,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(movies.releaseDate.substring(0, 4)),
              SizedBox(
                width: 20,
              ),
              Text(data.runtime.toString() + " Min")
            ],
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: null,
            backgroundColor: paletteColor,
            child: Icon(
              Icons.play_arrow,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

//   Widget _buildDetailsWidget(MovieDetailsResponse data) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Stack(
//             alignment: Alignment.topCenter,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.topCenter,
//                 width: double.infinity,
//                 height: 500,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     image: DecorationImage(
//                         image: CachedNetworkImageProvider(
//                             Constants.imgUrl + data.posterPath),
//                         fit: BoxFit.fill)),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 500,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [
//                         ConfigerBloc().darkModeOn
//                             ? Colors.black.withOpacity(1.0)
//                             : Colors.white.withOpacity(0.9),
//                         ConfigerBloc().darkModeOn
//                             ? Colors.black.withOpacity(0.0)
//                             : Colors.white.withOpacity(0.0)
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       stops: [0.0, 0.9]),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
}
