import 'package:dio/dio.dart';
import 'package:flutter_moviedemo/model/cast/cast_response.dart';
import 'package:flutter_moviedemo/model/genre/genre_response.dart';
import 'package:flutter_moviedemo/model/movie/movie_response.dart';
import 'package:flutter_moviedemo/model/movie_details/movie_details_response.dart';
import 'package:flutter_moviedemo/model/person/person_details.dart';
import 'package:flutter_moviedemo/model/person/person_response.dart';
import 'package:flutter_moviedemo/model/video/videos_response.dart';

class MovieRepository {
  static const String apiKey = '668135bda25e0f94b5bd4d8fa64c85cb';
  static const String mainUrl = 'https://api.themoviedb.org/3';
  static const String en_US = 'en_US';
  static const String getPopularUrl = '$mainUrl/movie/top_rated';
  static const String getMoviesUrl = '$mainUrl/discover/movie';
  static const String getPlayingUrl = '$mainUrl/movie/now_playing';
  static const String getGenreUrl = '$mainUrl/genre/movie/list';
  static const String getDetailsUrl = '$mainUrl/movie';
  static const String getpersonUrl = '$mainUrl/person/popular';
  static const String getpersonDetailsUrl = '$mainUrl/person';

  static const String getTopRatedUrl = '$mainUrl/movie/top_rated';
  static const String getMovieDetailsUrl = '$mainUrl/movie/';

  final Dio _dio = Dio();

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": en_US, "page": 1};
    try {
      var response = await _dio.get(getPopularUrl, queryParameters: params);
      print("####getMovies####");

      print(response);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return MovieResponse.withError(error);
    }
  }

  Future<MovieResponse> getTopRatedMovies() async {
    var params = {"api_key": apiKey, "page": 1};
    try {
      var response = await _dio.get(getTopRatedUrl, queryParameters: params);
      print("####getTopRatedMovies####");

      print(response);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return MovieResponse.withError(error);
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": en_US, "page": 1};
    try {
      Response response =
      await _dio.get(getPlayingUrl, queryParameters: params);
      print("####getPlayingMovies####");

      print(response);

      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return MovieResponse.withError(error.toString());
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": en_US, "page": 1};
    try {
      Response response = await _dio.get(getGenreUrl, queryParameters: params);
      print("####getGenres####");

      print(response);

      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return GenreResponse.withError(error);
    }
  }

  Future<Person> getPersons() async {
    var params = {"api_key": apiKey, "language": en_US, "page": 1};
    try {
      Response response = await _dio.get(getpersonUrl, queryParameters: params);
      print("####getPersons####");

      print(response);

      return Person.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return Person.withError(error);
    }
  }

  Future<MovieResponse> getMoviesByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": en_US,
      "page": 1,
      "with_genres": id
    };
    try {
      var response = await _dio.get(getMoviesUrl, queryParameters: params);
      print("####getMoviesByGenre####==$id");
      print(response);

      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return MovieResponse.withError(error.toString());
    }
  }

  Future<MovieDetailsResponse> getMovieDetail(int movieId) async {
    var params = {
      "api_key": apiKey,
      "language": en_US,
    };
    try {
      var response =
      await _dio.get(getDetailsUrl + "/$movieId", queryParameters: params);
      print("####MovieDetailsResponse####==$movieId");
      print(response);

      return MovieDetailsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return MovieDetailsResponse.withError(error.toString());
    }
  }

  Future<CastResponse> getCasts(int movieId) async {
    var params = {
      "api_key": apiKey,
    };
    try {
      var response = await _dio.get(getDetailsUrl + "/$movieId" + "/credits",
          queryParameters: params);
      print("####CastResponse####==$movieId");
      print(response);

      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return CastResponse.withError(error.toString());
    }
  }

  Future<MovieResponse> getSimilarMovies(int movieId) async {
    var params = {
      "api_key": apiKey,
    };
    try {
      var response = await _dio.get(getDetailsUrl + "/$movieId" + "/similar",
          queryParameters: params);
      print("####CastResponse####==$movieId");
      print(response);

      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return MovieResponse.withError(error.toString());
    }
  }

  Future<VideoResponse> getMovieVideo(int movieId) async {
    var params = {
      "api_key": apiKey,
    };
    try {
      var response = await _dio.get(getDetailsUrl + "/$movieId" + "/videos",
          queryParameters: params);
      print("####VideoResponse####==$movieId");
      //print(object)
      print(response);

      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return VideoResponse.withError(error.toString());
    }
  }

  Future<PersonDetails> getPersonDetails(int personId) async {
    var params = {
      "api_key": apiKey,
    };
    try {
      var response = await _dio.get(getpersonDetailsUrl + "/$personId",
          queryParameters: params);
      print("####getPersonDetails####==$personId");
      print(response);

      return PersonDetails.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception in Repo : $error stackTrace : $stacktrace");
      return PersonDetails.withError(error.toString());
    }
  }
}

