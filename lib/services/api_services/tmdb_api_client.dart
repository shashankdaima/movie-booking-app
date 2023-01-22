import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'tmdb_api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class TmdbApiClient {
  factory TmdbApiClient(Dio dio) = _TmdbApiClient;
  static const apiKey = "ffe7a60a6c4793a92f249a1fc679004a";

  @GET("/trending/movie/week?api_key=${TmdbApiClient.apiKey}&language=en-US")
  Future getTrendingMovies();

  @GET("/movie/{movieId}?api_key=${TmdbApiClient.apiKey}&language=en-US")
  Future getMovieById(@Path("movieId") String id);

  @GET(
      "/search/movie?api_key=${TmdbApiClient.apiKey}&language=en-US&include_adult=true")
  Future getMovieByName(
    @Query("query") String s, {
    @Query("page") int pageNo = 1,
  });
}
