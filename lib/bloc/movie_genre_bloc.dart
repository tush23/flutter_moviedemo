import 'package:flutter_moviedemo/model/genre/genre_response.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class GenreListBloc{

  final MovieRepository _movieRepository=MovieRepository();
  final BehaviorSubject<GenreResponse> _subject = BehaviorSubject<GenreResponse>();

  getGenres() async{
    GenreResponse genreResponse=await _movieRepository.getGenres();
    _subject.sink.add(genreResponse);
  }
  dispose(){
    _subject.close();
  }
  BehaviorSubject<GenreResponse> get subject=>_subject;
}
final genreListBloc=GenreListBloc();
