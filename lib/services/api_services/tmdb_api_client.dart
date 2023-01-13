import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'tmdb_api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class TmdbApiClient {
  factory TmdbApiClient(Dio dio) = _TmdbApiClient;
  static const apiKey = "ffe7a60a6c4793a92f249a1fc679004a";
  
  @GET("/trending/movie/week?api_key=ffe7a60a6c4793a92f249a1fc679004a&language=en-US")
  Future getTrendingMovies();
}
