import 'package:management_product_demo/home/product/models/Product.dart';
import 'package:management_product_demo/view/base_view.dart';

abstract interface class ProductView implements BaseView{

  void onGetAllProductByCategorySuccess(List<Product>list);
  void onGetProductByIdSuccess(Product product);
  void onLoadingProductById();
  void onHidingProductById();
}