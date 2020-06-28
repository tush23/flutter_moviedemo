import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/model/person/person_response.dart';
import 'package:flutter_moviedemo/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class PersonListBloc{

  final MovieRepository _movieRepository=MovieRepository();
  final BehaviorSubject<Person> _subject = BehaviorSubject<Person>();

  getPerson() async{
    Person movieResponse=await _movieRepository.getPersons();
    _subject.sink.add(movieResponse);
  }
  dispose(){
    _subject.close();
  }
  BehaviorSubject<Person> get subject=>_subject;

 
}
final personBloc=PersonListBloc();

