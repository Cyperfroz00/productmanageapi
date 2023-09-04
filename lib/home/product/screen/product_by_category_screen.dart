import 'package:flutter/material.dart';
import 'package:management_product_demo/home/product/models/Product.dart';
import 'package:management_product_demo/home/product/presenter/product_presenter.dart';
import 'package:management_product_demo/home/product/view/product_view.dart';

class ProductByCategoryScreen extends StatefulWidget {
  String categoryName;
  ProductByCategoryScreen({super.key, required this.categoryName});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> implements ProductView{
  List<Product> list =[];
  late ProductPresenter productPresenter;
  bool loading = false ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productPresenter=ProductPresenter(this);
    productPresenter.getAllProductByCategory(widget.categoryName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(widget.categoryName.toUpperCase()),
      ),
      body: Container(
        child: loading==true ? CircularProgressIndicator(
          color: Colors.indigo ,
        ) : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, index) {
              var product =list[index];
          return Container(
            margin: EdgeInsets.only(top: 5,left: 5,right: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.03)
            ),
            child: ListTile(
              leading: Image.network("${product.thumbnail}",width: 80,height: 100,),
              title: Text("${product.title}"),
              subtitle: Text("${product.description}"),
              trailing: Icon(Icons.navigate_next_rounded),
            ),
          );
        }),
      ),
    );
  }

  @override
  void onError(String message) {
    // TODO: implement onError
    print ("Error ${message}");
  }

  @override
  void onGetAllProductByCategorySuccess(List<Product> list) {
    // TODO: implement onGetAllProductByCategorySuccess
    setState(() {
      this.list=list;
    });
  }

  @override
  void onHiding() {
    // TODO: implement onHiding
    setState(() {
      loading =false;
    });
  }

  @override
  void onLoading() {
    // TODO: implement onLoading
    loading =true;
  }

  @override
  void onSuccess(Object data) {
    // TODO: implement onSuccess
  }
}
