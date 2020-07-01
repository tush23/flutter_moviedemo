import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieSimilerBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getSimilerMovies(id) async {
    MovieResponse genreResponse = await _movieRepository.getSimilarMovies(id);
    _subject.sink.add(genreResponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieSimilerBloc = MovieSimilerBloc();
