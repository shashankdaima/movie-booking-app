import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'supabase_api_client.g.dart';
/*

curl 'https://hacrfjmcnabemfdoytgr.supabase.co/rest/v1/trending_thumbnails?select=*' \
-H "apikey: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhY3Jmam1jbmFiZW1mZG95dGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNDI3MjQsImV4cCI6MTk4ODYxODcyNH0.rXz5MwEhBaUUi7vBuEyBBp3EgiZTuL49yC6QBeYtAO8" \
-H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhY3Jmam1jbmFiZW1mZG95dGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNDI3MjQsImV4cCI6MTk4ODYxODcyNH0.rXz5MwEhBaUUi7vBuEyBBp3EgiZTuL49yC6QBeYtAO8"
*/

@RestApi(baseUrl: "https://hacrfjmcnabemfdoytgr.supabase.co/rest/v1")
abstract class SupabaseApiClient{
  factory SupabaseApiClient(Dio dio)=_SupabaseApiClient;
  static const bearerToken="Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhY3Jmam1jbmFiZW1mZG95dGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNDI3MjQsImV4cCI6MTk4ODYxODcyNH0.rXz5MwEhBaUUi7vBuEyBBp3EgiZTuL49yC6QBeYtAO8";
  @GET("/trending_thumbnails")
  Future getTrendingThumbnails(
    {
      @Query("select") String select="*",
      @Header("apiKey") String apiKey="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhY3Jmam1jbmFiZW1mZG95dGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNDI3MjQsImV4cCI6MTk4ODYxODcyNH0.rXz5MwEhBaUUi7vBuEyBBp3EgiZTuL49yC6QBeYtAO8",
      @Header("Authorization")  String bearer =SupabaseApiClient.bearerToken,
    }
  );
  
}