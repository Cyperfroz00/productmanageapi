import 'package:flutter/material.dart';
import 'package:management_product_demo/home/product/models/Product.dart';
class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen({super.key ,required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Product Details!"),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Product Name:"),
              Text("${widget.product.title}"),
            ],
          ),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Price:"),
                Text("\$ ${widget.product.price!.toStringAsFixed(2)}"),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Discount:"),
                Text("${widget.product.discountPercentage!.toStringAsFixed(2)} %"),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Rate:"),
                Text("${widget.product.rating!}"),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Stock:"),
                Text("${widget.product.stock!.toStringAsFixed(0)}"),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Product Category:"),
                Text("${widget.product.category!.toUpperCase()}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
