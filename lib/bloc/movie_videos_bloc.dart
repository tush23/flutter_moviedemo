import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/model/video/videos_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieVideoBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
      BehaviorSubject<VideoResponse>();

  getMoviesVideo(id) async {
    VideoResponse movieResponse = await _movieRepository.getMovieVideo(id);
    _subject.sink.add(movieResponse);
  }

  void drainStream() {
    _subject.value = null;
    @mustCallSuper
    void dispose() async {
      await _subject.drain();
      _subject.close();
    }
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}

final movieVideoBloc = MovieVideoBloc();
