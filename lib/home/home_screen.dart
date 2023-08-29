import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../auth/constants/constants.dart';
import '../auth/model/login_response.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage(Constants.user_local_key);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home Screen" ,style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text("Login Success"),
              Text("${storage.getItem(Constants.user_name_key)}")
            ],
          ),
        ),
      ),
    );
  }
}
