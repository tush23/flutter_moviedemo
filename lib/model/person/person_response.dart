import 'package:flutter_moviedemo/model/person/person_results.dart';

class Person {
  int _page;
  int _totalPersonResults;
  int _totalPages;
  List<PersonResults> _results;
  String error;

  Person({int page,String error, int totalPersonResults, int totalPages, List<PersonResults> results}) {
    this._page = page;
    this._totalPersonResults = totalPersonResults;
    this._totalPages = totalPages;
    this._results = results;
    this.error = error;
  }

  int get page => _page;
  set page(int page) => _page = page;
  int get totalPersonResults => _totalPersonResults;
  set totalPersonResults(int totalPersonResults) => _totalPersonResults = totalPersonResults;
  int get totalPages => _totalPages;
  set totalPages(int totalPages) => _totalPages = totalPages;
  List<PersonResults> get results => _results;
  set results(List<PersonResults> results) => _results = results;

  Person.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    _totalPersonResults = json['total_results'];
    _totalPages = json['total_pages'];
    if (json['results'] != null) {
      _results = new List<PersonResults>();
      json['results'].forEach((v) {
        _results.add(new PersonResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    data['total_results'] = this._totalPersonResults;
    data['total_pages'] = this._totalPages;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Person.withError(String errroMsg)
      :_results=List(),
        error=errroMsg;
}