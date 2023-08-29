import 'package:management_product_demo/auth/model/login_request.dart';
import 'package:management_product_demo/auth/model/login_response.dart';
import '../models/http_base_response.dart';

abstract interface class HttpRepository{
  Future<HttpBaseResponse<LoginResponse>> login(LoginRequest req);
  Future<HttpBaseResponse<List<String>>> getAllCategory();
}