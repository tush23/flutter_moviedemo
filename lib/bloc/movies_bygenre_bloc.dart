import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MoviesListByGenres {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenres(id) async {
    MovieResponse genreResponse = await _movieRepository.getMoviesByGenre(id);
    print("######getMoviesByGenres#####");
    //print(genreResponse.results[3].originalTitle);

    _subject.sink.add(genreResponse);

    print(_subject.stream);
  }

  void drainStream() {
    _subject.value = null;
    @mustCallSuper
    void dispose() async {
      await _subject.drain();
      _subject.close();
    }
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesListByGenreBloc = MoviesListByGenres();
