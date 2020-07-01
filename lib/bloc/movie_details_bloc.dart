import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/model/movie_details/movie_details_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieDetailsBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieDetailsResponse> _subject =
      BehaviorSubject<MovieDetailsResponse>();

  getMoviesDetails(movieId) async {
    MovieDetailsResponse movieResponse =
        await _movieRepository.getMovieDetail(movieId);
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

  BehaviorSubject<MovieDetailsResponse> get subject => _subject;
}

final movieDetailsBloc = MovieDetailsBloc();
