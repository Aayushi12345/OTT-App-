import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  String dropdownvalue = 'Male';

  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var items = [
    'Male',
    'Female',
  ];
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
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Sign-Up")),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
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
                            labelText: "Name",
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
                            if (value!.isEmpty ) {
                              return 'Enter a name!';
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
                          child: Text('Name'),
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
              // Dob
              //   Container(
              //     padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              //     child: DOBInputField(
              //       firstDate: DateTime(1900),
              //       lastDate: DateTime.now(),
              //       showLabel: true,
              //       showCursor: true,
              //       autovalidateMode: AutovalidateMode.always,
              //       fieldLabelText: "With label",
              //     ),
              //   ),

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
                            labelText: "confirm Password",
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
                          child: Text('Confirm Password'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Female
                Container(
                  decoration: BoxDecoration(  borderRadius: BorderRadius.circular(15.0),
                      border: Border.all()),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 5,bottom: 5,right: 5),

                    // padding: const EdgeInsets.all(5.0),
                    child: DropdownButton(

                      isExpanded: true,
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,

                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(

                    margin:EdgeInsets.only(top: 20, bottom: 20) ,
                    width: 300,
                    child: TextButton(
                      onPressed: () => _submit(),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.all(16.0),
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(fontSize: 20)),
                      child: Text('   Register   '),
                    ),
                  ),
                ),

                Container(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Text("Login"),
                  ),

                )
              ]),
            ),
          ),
        ));
  }
}
