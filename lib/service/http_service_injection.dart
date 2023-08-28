import 'package:management_product_demo/repository/http_repository.dart';
import 'package:management_product_demo/repository/http_repository_impl.dart';

class HttpServiceInjection {
  static final HttpServiceInjection _singleton = HttpServiceInjection._internal();
  factory HttpServiceInjection(){
    return _singleton;
  }
  HttpServiceInjection._internal();
  HttpRepository get httpRepository => HttpRepositoryImpl();
}