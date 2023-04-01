import 'package:http/http.dart' as http;
import 'package:planner/models/base_response.dart';
import 'package:planner/rest/api_constants.dart';
import 'package:planner/rest/base/base_service.dart';

class SignUpService extends BaseService {

  Future<BaseResponseFormat> signup(Map requestBody) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.signUp);
      var response = await http.post(url,
          headers: setBearerToken(authToken!), body: createRequestBody(requestBody));
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something Went wrong");
    }
  }
}