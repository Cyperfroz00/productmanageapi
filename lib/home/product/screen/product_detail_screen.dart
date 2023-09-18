import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:management_product_demo/home/product/models/Product.dart';
import 'package:management_product_demo/home/product/presenter/product_presenter.dart';
import 'package:management_product_demo/home/product/view/product_view.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> implements ProductView{

  late ProductPresenter productPresenter;
  Product product = Product();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productPresenter=ProductPresenter(this);
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Product Details!",style: TextStyle(color: Colors.white),),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
         productPresenter.getProductById(product.id!);
        },
        child: ListView(
          children: [
            Container(margin: EdgeInsets.all(5),),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items:product.images!.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.indigo
                        ),
                        child: Image.network("${i}"
                        ,height: 400,fit: BoxFit.contain,),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Name:"),
                  Text("${product.title}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Price:"),
                  Text("\$ ${product.price!.toStringAsFixed(2)}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Discount:"),
                  Text(
                      "${product.discountPercentage!.toStringAsFixed(2)} %"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Rate:"),
                  Text("${product.rating!}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Stock:"),
                  Text("${product.stock!.toStringAsFixed(0)}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Category:"),
                  Text("${product.category!.toUpperCase()}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text("Product Description:"),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "${product.description}",
                maxLines: 1000,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              size: 30.0,
            ),
            label: 'Dashboard',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.search,
          //     size: 30.0,
          //   ),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inbox,
              size: 30.0,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  @override
  void onError(String message) {
    // TODO: implement onError
  }

  @override
  void onGetAllProductByCategorySuccess(List<Product> list) {
    // TODO: implement onGetAllProductByCategorySuccess
  }

  @override
  void onGetProductByIdSuccess(Product product) {
    // TODO: implement onGetProductByIdSuccess

  }

  @override
  void onHiding() {
    // TODO: implement onHiding
  }

  @override
  void onHidingProductById() {
    // TODO: implement onHidingProductById
    Navigator.pop(context);
  }

  @override
  void onLoading() {
    // TODO: implement onLoading
  }

  @override
  void onLoadingProductById() {
    showMessageDialog(context);
    // TODO: implement onLoadingProductById
  }

  @override
  void onSuccess(Object data) {
    // TODO: implement onSuccess
  }
  static showMessageDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.indigo,
          ),
        );
      },
    );
  }
}
