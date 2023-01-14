import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_booking_app/models/responses/movie_details.dart';
import 'package:movie_booking_app/models/responses/trending_movies_response.dart';
import 'package:movie_booking_app/services/api_services/supabase_api_client.dart';
import 'package:movie_booking_app/services/api_services/tmdb_api_client.dart';

import '../../models/responses/movie.dart';
import '../../models/responses/thumbnail_response.dart';
import '../../utils/api_response.dart';

/**
 *  This is "equilvant" to repository where as API Client is just retrofit instance to handle api responses. 
 *  Techincally we should make interface but that was too much for example apps. 
 */
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  late final TmdbApiClient tmdbClient;
  late final SupabaseApiClient supabaseApiClient;
  late final Dio dio;
  ApiService() {
    dio = Dio(BaseOptions(connectTimeout: 20000));
    tmdbClient = TmdbApiClient(dio);
    supabaseApiClient = SupabaseApiClient(dio);
  }
  Future<ApiResponse<TrendingMoviesResponse>> getTrendingMovies() async {
    try {
      final res = await tmdbClient.getTrendingMovies();
      return ApiResponse.success(TrendingMoviesResponse.fromJson(res));
    } catch (e) {
      if ((e as DioError).type == DioErrorType.response) {
        final res = e.response;
        debugPrint(res!.statusMessage ?? "");
        return ApiResponse.error(res!.statusMessage ?? "");
      }
      return ApiResponse.error(await _checkNetworkAndReturnError());
    }
  }

  Future<ApiResponse<List<ThumbnailResponse>>> getThumbnails() async {
    try {
      final res = await supabaseApiClient.getTrendingThumbnails() as List;
      return ApiResponse.success(
          res.map((e) => ThumbnailResponse.fromJson(e)).toList());
    } catch (e) {
      debugPrint(e.toString());
      return await _handleError(e);
    }
  }

  Future<ApiResponse<MovieDetails>> getMoviesById(String id) async {
    try {
      final res = await tmdbClient.getMovieById(id);
      return ApiResponse.success(MovieDetails.fromJson(res));
    } catch (e) {
      if ((e as DioError).type == DioErrorType.response) {
        final res = e.response;
        debugPrint(res!.statusMessage ?? "");
        return ApiResponse.error(res!.statusMessage ?? "");
      }
      return ApiResponse.error(await _checkNetworkAndReturnError());
    }
  }

  /// handles error, and returns an ApiResponse based on the error
  Future<ApiResponse<DataType>> _handleError<DataType>(e) async {
    switch (e.runtimeType) {
      case DioError:
        // non-200 response goes here.
        if ((e as DioError).type == DioErrorType.response) {
          final res = e.response;
          if (res?.statusCode == 401) {
            return ApiResponse<DataType>.authError();
          }
        }
        break;
    }
    return ApiResponse<DataType>.error(await _checkNetworkAndReturnError());
  }

  Future<String> _checkNetworkAndReturnError() async {
    return (await hasInternetAccess()) == false
        ? 'Oh snap! It seems you\'re offline.'
        : 'Something went wrong!';
  }

  Future<bool?> hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return null;
  }
}
