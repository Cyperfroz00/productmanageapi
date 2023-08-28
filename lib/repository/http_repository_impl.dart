import 'dart:convert';
import 'package:management_product_demo/auth/model/login_request.dart';
import 'package:management_product_demo/auth/model/login_response.dart';
import 'package:management_product_demo/repository/http_repository.dart';
import 'package:management_product_demo/service/api.dart';
import 'package:http/http.dart' as http;
import '../models/http_base_response.dart';

class HttpRepositoryImpl extends Api implements HttpRepository {
  @override
  Future<HttpBaseResponse<LoginResponse>> login(LoginRequest req) async {
    try {
      var url = Uri.parse(loginUrl);
      var response = await http.post(
        url,
        body: req.toJson(),
      );
      final Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse(
            code: 200,
            isSuccess: true,
            message: map["message"],
            data: LoginResponse.fromJson(map)
        );
      } else {
        return HttpBaseResponse(
          code: 400,
          isSuccess: false,
          message: map["message"],
          data: null,
        );
      }
    } catch (e) {
      return HttpBaseResponse(
        code: 500,
        isSuccess: false,
        message: e.toString(),
        data: null,
      );
    }
  }
}
