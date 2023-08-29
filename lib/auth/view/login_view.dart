import 'package:management_product_demo/auth/model/login_response.dart';
import 'package:management_product_demo/view/base_view.dart';
abstract interface class LoginView implements BaseView {
  void onGetLoginSuccess(LoginResponse loginResponse);
}