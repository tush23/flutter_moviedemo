import 'package:flutter_moviedemo/model/video/videos_results.dart';

class VideoResponse {
  int _id;
  List<VideoResult> _results;

  VideoResponse({int id, List<VideoResult> results}) {
    this._id = id;
    this._results = results;
  }

  int get id => _id;

  set id(int id) => _id = id;

  List<VideoResult> get results => _results;

  set results(List<VideoResult> results) => _results = results;

  VideoResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['results'] != null) {
      _results = new List<VideoResult>();
      json['results'].forEach((v) {
        _results.add(new VideoResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<VideoResponse> withError(String string) {}
}
