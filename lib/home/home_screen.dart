import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:management_product_demo/home/presenter/home_presenter.dart';
import 'package:management_product_demo/home/view/home_view.dart';
import '../auth/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  List<String> categoriesList = [];
  bool loading = false;
  late HomePresenter presenter;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    presenter = HomePresenter(this);
    presenter.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage(Constants.user_local_key);
    var product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading == true ? Center(
        child: CircularProgressIndicator(
        ),
      ): ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              itemCount: categoriesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (context,index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.pink[300],
                  ),
                  child: Center(child: Text("${categoriesList[index]}")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onError(String message) {

  }

  @override
  void onGetCategorySuccess(List<String> categories) {
    setState(() {
      categoriesList = categories;
    });
  }

  @override
  void onHiding() {
    // TODO: implement onHiding
    setState(() {
      loading = false;
    });
  }

  @override
  void onLoading() {
    // TODO: implement onLoading
    setState(() {
      loading = true;
    });
  }

  @override
  void onSuccess(Object data) {
    // TODO: implement onSuccess
  }
}