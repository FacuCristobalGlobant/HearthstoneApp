import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/data/datasource/i_api_datasource.dart';
import 'package:http/http.dart' as http;

class ApiService extends IApiDatasource {
  @override
  Future<http.Response> getData({
    required Map<String, String> endpoint,
    required String keyword,
  }) async {
    final url = Uri.parse(
      '${ApiProperties.baseUrl}/${endpoint['endpoint']}/$keyword',
    );
    final response = await http.get(
      url,
      headers: ApiProperties.apiHeaders,
    );
    return response;
  }
}
