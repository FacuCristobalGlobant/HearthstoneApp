import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/data/datasource/i_api_datasource.dart';
import 'package:http/http.dart' as http;

class MockApiService extends IApiDatasource {
  @override
  Future<http.Response> getData({
    required Map<String, String> endpoint,
    String keyword = Strings.emptyString,
  }) async {
    final url = Uri.parse(
      ApiProperties.mockApiBaseUrl,
    );
    final response = await http.get(
      url,
    );
    return response;
  }
}
