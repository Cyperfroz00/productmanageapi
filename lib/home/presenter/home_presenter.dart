import 'package:management_product_demo/home/view/home_view.dart';
import 'package:management_product_demo/repository/http_repository.dart';
import 'package:management_product_demo/service/http_service_injection.dart';

class HomePresenter{
  late HttpRepository httpRepository;
  late HomeView view;
  HomePresenter(this.view){
    httpRepository = HttpServiceInjection().httpRepository;
  }


  void getAllCategories(){
    view.onLoading();
    httpRepository.getAllCategory().then((value){
     view.onHiding();
     if(value.isSuccess==true){
       view.onGetCategorySuccess(value.data!);
     }else{
       view.onError(value.message!);
     }
    });
  }
}