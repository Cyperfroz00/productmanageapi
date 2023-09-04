import 'package:management_product_demo/auth/model/login_request.dart';
import 'package:management_product_demo/auth/model/login_response.dart';
import 'package:management_product_demo/home/product/models/Product.dart';
import '../models/http_base_response.dart';

abstract interface class HttpRepository{
  Future<HttpBaseResponse<LoginResponse>> login(LoginRequest req);
  Future<HttpBaseResponse<List<String>>> getAllCategory();
  Future<HttpBaseResponse<List<Product>>> getAllProductByCategoryName(String name);
}