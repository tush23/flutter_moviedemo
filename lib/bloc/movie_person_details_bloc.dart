import 'package:flutter_moviedemo/model/person/person_details.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class PersonDetailsBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<PersonDetails> _subject =
      BehaviorSubject<PersonDetails>();

  getPersonDetails(id) async {
    PersonDetails movieResponse = await _movieRepository.getPersonDetails(id);
    _subject.sink.add(movieResponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonDetails> get subject => _subject;
}

final personDetailsBloc = PersonDetailsBloc();
