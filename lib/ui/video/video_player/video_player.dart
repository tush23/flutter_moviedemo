import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_videos_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/model/video/videos_response.dart';
import 'package:flutter_moviedemo/model/video/videos_results.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final int id;

  const VideoPlayerScreen({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(id);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController youtubePlayerController;
  final int id;

  _VideoPlayerScreenState(this.id);

  @override
  void initState() {
    super.initState();
    movieVideoBloc..getMoviesVideo(id);
  }

  @override
  void dispose() {
    super.dispose();
    movieVideoBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<VideoResponse>(
        stream: movieVideoBloc.subject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print("Snpashot==$snapshot");

            return _builsVideoWidget(snapshot.data);
          } //else if (snapshot.error) {
          //return _buildErrorWidget(snapshot.error);}
          else
            return _buildLoadingWidget();
        },
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    var Constants;
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

  Widget _builsVideoWidget(VideoResponse data) {
    List<VideoResult> videos = data.results;
    return Stack(
      children: <Widget>[
        Center(
          child: YoutubePlayer(
            controller: YoutubePlayerController(
                initialVideoId: videos[0].key,
                flags: YoutubePlayerFlags(autoPlay: true)),
          ),
        ),
        Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(EvaIcons.closeCircle, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ))
      ],
    );
  }
}
