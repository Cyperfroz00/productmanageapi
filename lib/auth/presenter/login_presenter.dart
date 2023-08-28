import 'package:management_product_demo/auth/model/Login_request.dart';
import 'package:management_product_demo/auth/model/Login_response.dart';
import 'package:management_product_demo/repository/http_repository.dart';
import 'package:management_product_demo/service/http_service_injection.dart';
import '../view/login_view.dart';
class LoginPresenter {
  late LoginView view;
  late HttpRepository httpRepository;
  LoginPresenter(this.view) {
    httpRepository = HttpServiceInjection().httpRepository;
  }
  void login(LoginRequest req) {
    view.onLoading();
    httpRepository.login(req).then((value) => {
      view.onHiding(),
      if(value.isSuccess==false){
        view.onError(value.message!),
      }else{
        view.onGetLoginSuccess(value.data as LoginResponse)
    },
    });
  }
}
