// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SupabaseApiClient implements SupabaseApiClient {
  _SupabaseApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://hacrfjmcnabemfdoytgr.supabase.co/rest/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> getTrendingThumbnails({
    select = "*",
    apiKey =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhY3Jmam1jbmFiZW1mZG95dGdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNDI3MjQsImV4cCI6MTk4ODYxODcyNH0.rXz5MwEhBaUUi7vBuEyBBp3EgiZTuL49yC6QBeYtAO8",
    bearer = SupabaseApiClient.bearerToken,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'select': select};
    final _headers = <String, dynamic>{
      r'apiKey': apiKey,
      r'Authorization': bearer,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/trending_thumbnails',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
