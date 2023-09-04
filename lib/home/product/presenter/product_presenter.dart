import 'package:management_product_demo/home/product/view/product_view.dart';
import 'package:management_product_demo/repository/http_repository.dart';
import 'package:management_product_demo/service/http_service_injection.dart';

class ProductPresenter{
  late ProductView view;
  late HttpRepository httpRepository;
  ProductPresenter(this.view){
    httpRepository = HttpServiceInjection().httpRepository;
  }
  void getAllProductByCategory(String name){
    view.onLoading();
    httpRepository.getAllProductByCategoryName(name).then((value){
      view.onHiding();
      if(value.isSuccess==true){
        view.onGetAllProductByCategorySuccess(value.data!);
      }else{
        view.onError(value.message!);
      }
    });
  }
}