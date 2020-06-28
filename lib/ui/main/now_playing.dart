import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_now_playing_bloc.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';

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
    return StreamBuilder<MovieResponse>(
      stream: nowPlayingListBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildNowPlayingWidget(snapshot.data);
        } else if (snapshot.error) {
          return _buildErrorWidget(snapshot.error);
        } else
          return _buildLoadingWidget();
      },
    );
  }

  Widget _buildErrorWidget(String error) {}

  Widget _buildNowPlayingWidget(MovieResponse data) {}

  Widget _buildLoadingWidget() {}
}
