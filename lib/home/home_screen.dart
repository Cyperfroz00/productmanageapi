import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:management_product_demo/home/presenter/home_presenter.dart';
import 'package:management_product_demo/home/product/screen/product_by_category_screen.dart';
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
        leading: DrawerButton(
          style: ButtonStyle(
          ),
        ),
        backgroundColor: Colors.indigo,
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  color: Color(0XFF3F51b5),
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    //controller: _searchController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: categoriesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductByCategoryScreen(
                                      categoryName: categoriesList[index])));
                        },
                        child: Container(
                          // width: 100,
                          // height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.indigo,
                          ),
                          child:
                              Center(child: Text(
                                  "${categoriesList[index]}"
                              ,style: TextStyle(color: Colors.white),),
                              ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        //unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            label: 'Home',
          ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.cached,
               size: 30.0,
             ),
            label: 'Refresh',
           ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30.0,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  @override
  void onError(String message) {}

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
