import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieTopRatedListBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getTopRatedMovies() async {
    MovieResponse movieResponse = await _movieRepository.getTopRatedMovies();
    _subject.sink.add(movieResponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieTopRatedBloc = MovieTopRatedListBloc();
