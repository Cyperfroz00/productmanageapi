import 'package:flutter/material.dart';
import 'package:management_product_demo/auth/model/Login_request.dart';
import 'package:management_product_demo/auth/model/Login_response.dart';
import 'package:management_product_demo/auth/presenter/login_presenter.dart';
import 'package:management_product_demo/auth/view/login_view.dart';
import 'package:management_product_demo/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  late LoginPresenter presenter;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = LoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.white,
            )),
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _username,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter username";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password_outlined),
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty) {
                      return "Please enter password";
                    }return null;
                  },
                ),
              ),
              loading == true? Container(
                  padding: const EdgeInsets.all(25),
                  child: CircularProgressIndicator(
                    color: Colors.indigo,
                  )
              ):Container(
              ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          if(_formKey.currentState!.validate()){
            print("Username ${_username.text}");
            print("Password ${_password.text}");

            LoginRequest req = LoginRequest();
            req.username =_username.text;
            req.password =_password.text;
            presenter.login(req);
          }
        },
        child: Container(
          child: Row(
            children: [
              Container(
                height: 50,
                width: 200,
                margin: EdgeInsets.all(20),
                color: Colors.indigo,
                child: Center(
                  child: Text("Login",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _showMyDialog(String message ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('${message}',style: TextStyle(color: Colors.indigo),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void onError(String message) {
    _showMyDialog(message);
  }

  @override
  void onGetLoginSuccess(LoginResponse loginResponse) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          HomeScreen(loginResponse: loginResponse)));
  }

  @override
  void onHiding() {
    setState(() {
      loading = false;
    });
    // TODO: implement onHiding
  }

  @override
  void onLoading() {
    setState(() {
      loading = true;
    });
  }
}
