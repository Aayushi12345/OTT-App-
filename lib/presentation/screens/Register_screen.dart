import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';
@RoutePage()
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  String dropdownvalue = Constant.MALE;

  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var items = [
    Constant.MALE,
    Constant.FEMALE,
  ];

  void _submit() async {
    String? retrievedValue = await SharedPreferencesService.getString(Constant.EMAIL);
    debugPrint(retrievedValue);
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Navigator.pop(context);
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
          title: const Center(child: Text(Constant.SIGN_UP)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                              if (value!.isEmpty) {
                                return Constant.ENTER_VALID_NAME;
                              }
                              SharedPreferencesService.saveString(
                                  Constant.NAME, value);
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
                            child: Text(Constant.NAME_TEXT_INPUT),
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
                                  !RegExp(Constant.EMAIL_VALIDATION)
                                      .hasMatch(value)) {
                                return Constant.ENTER_VALID_EMAIL;
                              }
                              UserResponse user = UserResponse();
                              user.email = value;
                              SharedPreferencesService.saveString(
                                  Constant.EMAIL, value);
                              // user.email. =value
                              // SharedPreferencesService.saveString(
                              //     Constant.EMAIL, value);
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
                            child: Text(Constant.EMAIL),
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
                              labelText: Constant.DOB_TEXT_INPUT,
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
                              if (value!.isEmpty) {
                                return Constant.ENTER_VALID_DOB;
                              }
                              SharedPreferencesService.saveString(
                                  Constant.DOB, value);
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
                            child: Text(Constant.DOB_TEXT_INPUT),
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
                              labelText: Constant.PASSWORD_TEXT_INPUT,
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
                                return Constant.ENTER_VALID_PASSWORD;
                              }
                              SharedPreferencesService.saveString(
                                  Constant.PASSWORD, value);
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
                            child: Text(Constant.PASSWORD_TEXT_INPUT),
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
                              labelText: Constant.CONFIRM_PASSWORD,
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
                                return Constant.ENTER_VALID_PASSWORD;
                              }
                              return null;
                            },
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            color: Colors.white,
                            child: const Text(
                                Constant.CONFIRM_PASSWORD_TEXT_INPUT),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Female
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 5, bottom: 5, right: 5),

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
                            SharedPreferencesService.saveString(
                                Constant.GENDAR, dropdownvalue);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
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
                  ),

                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(Constant.LOGIN),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
