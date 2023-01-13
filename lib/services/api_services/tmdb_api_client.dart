

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'tmdb_api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3")
abstract class TmdbApiClient{
  factory TmdbApiClient(Dio dio)=_TmdbApiClient;
  
  
}