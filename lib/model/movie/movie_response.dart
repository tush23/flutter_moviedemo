import 'movie_results.dart';

class MovieResponse {
  int _page;
  List<MovieResults> _results;
  int _totalPages;
  int _totalResults;
  String error;

  MovieResponse({int page,
    List<MovieResults> results,
    int totalPages,
    int totalResults,
    String error}) {
    this._page = page;
    this._results = results;
    this._totalPages = totalPages;
    this._totalResults = totalResults;
    this.error = error;
  }

  int get page => _page;
  set page(int page) => _page = page;
  List<MovieResults> get results => _results;
  set results(List<MovieResults> results) => _results = results;
  int get totalPages => _totalPages;
  set totalPages(int totalPages) => _totalPages = totalPages;
  int get totalResults => _totalResults;
  set totalResults(int totalResults) => _totalResults = totalResults;

  MovieResponse.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = new List<MovieResults>();
      json['results'].forEach((v) {
        _results.add(new MovieResults.fromJson(v));

        //print(_results);
      });
      print("****" + _results[3].originalTitle);
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this._totalPages;
    data['total_results'] = this._totalResults;
    return data;
  }

  MovieResponse.withError(String errorMsg)
      : _results = List(),
        error = errorMsg;
}
