import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password_outlined),
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter password";
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          if(_formKey.currentState!.validate()){
            print("Username ${_username.text}");
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
}
