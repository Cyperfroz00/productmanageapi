import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:management_product_demo/auth/screen/login_screen.dart';
import 'package:management_product_demo/home/home_screen.dart';
import '../auth/constants/constants.dart';
import '../auth/model/login_response.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage(Constants.user_local_key);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, snapshot){
          if(snapshot.data==true){
            final userData = storage.getItem(Constants.user_name_key);
            if(userData !=null){
              return HomeScreen();
            }
            return LoginScreen();
          }else{
            return LoginScreen();
          }
        }),
      );
  }
}
