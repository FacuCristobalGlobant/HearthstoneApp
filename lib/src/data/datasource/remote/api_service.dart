import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> getData({
    String endpoint = '',
  }) async {
    final url = Uri.parse(
      '${ApiProperties.baseUrl}$endpoint',
    );
    final response = await http.get(
      url,
      headers: ApiProperties.apiHeaders,
    );
    return response;
  }
}
