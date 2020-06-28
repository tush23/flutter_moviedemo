import 'package:flutter_moviedemo/model/genre/genre_response.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class NowPlayingListBloc{

  final MovieRepository _movieRepository=MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getNowPlayingMovies() async{
    MovieResponse genreResponse=await _movieRepository.getPlayingMovies();
    _subject.sink.add(genreResponse);
  }
  dispose(){
    _subject.close();
  }
  BehaviorSubject<MovieResponse> get subject=>_subject;
}
final nowPlayingListBloc=NowPlayingListBloc();
