import 'dart:convert';
import 'package:management_product_demo/auth/model/login_request.dart';
import 'package:management_product_demo/auth/model/login_response.dart';
import 'package:management_product_demo/home/product/models/Product.dart';
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

  @override
  Future<HttpBaseResponse<List<String>>> getAllCategory() async {
    try{
      var url = Uri.parse(getAllCategoriesUrl);
      var response = await http.get(url);
      List<String> stringList = (jsonDecode(response.body) as List<dynamic>).cast<String>();
      if(response.statusCode == 200){
        return HttpBaseResponse(
          code: 200,
          isSuccess: true,
          data: stringList,
        );
      }else{
        return HttpBaseResponse(
            code: 400,
            isSuccess: false,
            message: "Get Success",
            data: null);
      }
    }catch(e){
            return HttpBaseResponse(
            code: 500,
            isSuccess: false,
            message: e.toString(),
            data: null);
    }}

  @override
  Future<HttpBaseResponse<List<Product>>> getAllProductByCategoryName(String name) async {
    // TODO: implement getAllProductByCategoryName
    List<Product> list =[];
    try{
      var url = Uri.parse(getAllProductByCategoryNameUrl+name);
      var response = await http.get(url);
      Map<String ,dynamic> map = jsonDecode(response.body);
      if(response.statusCode==200){
        map["products"].forEach((product){
          list.add(Product.fromJson(product));
        });
        return HttpBaseResponse(
          message: "Get data success",
          code: 200,
          isSuccess: true,
          data: list,
        );
      }else{
        return HttpBaseResponse(
          message: "data not found",
            code:400,
            isSuccess: false,
            data: null
        );
      }
    }catch(e){
      return HttpBaseResponse(
          code:500,
          isSuccess: false,
          data: null,
          message: "General Error ${e.toString()}");
    }
  }}