import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/model/cast/cast_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class CastBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getCasts(id) async {
    CastResponse genreResponse = await _movieRepository.getCasts(id);
    _subject.sink.add(genreResponse);
  }

  void drainStream() {
    _subject.value = null;
    @mustCallSuper
    void dispose() async {
      await _subject.drain();
      _subject.close();
    }
  }

  BehaviorSubject<CastResponse> get subject => _subject;
}

final castBloc = CastBloc();
