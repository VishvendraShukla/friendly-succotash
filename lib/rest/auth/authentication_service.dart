import 'package:http/http.dart' as http;
import 'package:planner/models/base_response.dart';
import 'package:planner/rest/api_constants.dart';
import 'package:planner/rest/base/base_service.dart';
import 'package:planner/utils/app_globals.dart';

class AuthenticationService extends BaseService {
  Future<BaseResponseFormat> verifyUsername(String username) async {
    Map data = {'username': username};
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.generate);
      var response = await http.post(url,
          headers: setHeaders(), body: createRequestBody(data));
      token = response.headers['token'];
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }

  Future<BaseResponseFormat> verifyUser(
      String username, String password) async {
    Map data = {'username': username, 'password': password, 'token': token};
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.generateToken);
      var response = await http.post(url,
          headers: setHeaders(), body: createRequestBody(data));
      authToken = response.headers['authorization'];
      storage.write(key: "authToken", value: authToken);
      storage.write(key: "login", value: "true");
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something Went wrong");
    }
  }

  Future<BaseResponseFormat> login(String username, String password) async {
    Map data = {'username': username, 'password': password};
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
      var response = await http.put(url,
          headers: setBearerToken(authToken!), body: createRequestBody(data));
      return getBaseResponseFormat(response.body);
    } catch (e) {
      throw Exception("Something Went wrong");
    }
  }
}
