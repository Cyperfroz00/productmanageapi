import 'package:management_product_demo/auth/model/login_response.dart';

abstract interface class LoginView {
  void onLoading();
  void onHiding();
  void onError(String message);
  void onGetLoginSuccess(LoginResponse loginResponse);
}