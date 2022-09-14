import 'package:http/http.dart' as http;

abstract class IApiDatasource {
  Future<http.Response> getData({
    required Map<String, String> endpoint,
    required String keyword,
  });
}
