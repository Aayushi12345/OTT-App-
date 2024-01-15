import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Login")),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Image.asset(
                  'assets/images/ott.png',
                  height: 150,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  // padding: new EdgeInsets.all(20.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: "Email ID",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          color: Colors.white,
                          child: Text('Email'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  // padding: new EdgeInsets.all(20.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                          ),
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valid password!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          color: Colors.white,
                          child: Text('Password'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: 300,
                    child: TextButton(
                      onPressed: () => _submit(),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.all(16.0),
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(fontSize: 20)),
                      child: Text('   Login   '),
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Text("Register new Account"),
                  ),

                )
              ]),
            ),
          ),
        ));
  }
}
