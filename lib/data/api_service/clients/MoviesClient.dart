import 'package:informermobile_flutter/data/api_service/base/ApiClient.dart';
import 'package:informermobile_flutter/data/api_service/base/ApiResult.dart';
import 'package:informermobile_flutter/data/api_service/base/NetworkExceptions.dart';
import 'package:informermobile_flutter/data/model/movie_response.dart';

class MoviesClient {
  ApiClient _apiClient = ApiClient.getInstance;

  Future<ApiResult<List<Movie>>> fetchMovieList() async {
    try {
      final response = await _apiClient
          .get("movie/popular", queryParameters: {"api_key": ""});
      List<Movie> movieList = MovieResponse.fromJson(response).results;
      return ApiResult.success(data: movieList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
