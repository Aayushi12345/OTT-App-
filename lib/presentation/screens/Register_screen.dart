import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';
import 'package:ott_app/utils/ttn_flix_date_picker.dart';
@RoutePage()
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
final TextEditingController _dobEditingController = TextEditingController();
final TextEditingController _nameEditingController = TextEditingController();
final TextEditingController _emailEditingController = TextEditingController();
final TextEditingController _passwordEditingController = TextEditingController();

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
    String? retrievedValue = await SharedPreferencesService.getSingleString(Constant.EMAIL);
    debugPrint(retrievedValue);
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailEditingController.text,
        password: _passwordEditingController.text).then((value)     {
          debugPrint("Create a new Account");
          Navigator.pop(context);}
    ).onError((error, stackTrace)  {

      debugPrint("error${error.toString()}");
    });
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
          backgroundColor: Colors.blue,
          title: const Center(child: Text(Constant.SIGN_UP)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          controller: _nameEditingController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                            focusedBorder: OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                          ),
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (_nameEditingController.text!.isEmpty) {
                              return Constant.ENTER_VALID_NAME;
                            }
                            SharedPreferencesService.saveSingleString(
                                Constant.NAME, _nameEditingController.text);
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          controller: _emailEditingController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: "Email ID",
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                            focusedBorder: OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                          ),
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (_emailEditingController.text!.isEmpty ||
                                !RegExp(Constant.EMAIL_VALIDATION)
                                    .hasMatch(_emailEditingController.text)) {
                              return Constant.ENTER_VALID_EMAIL;
                            }
                            UserResponse user = UserResponse();
                            user.email = _emailEditingController.text;
                            SharedPreferencesService.saveSingleString(
                                Constant.EMAIL, _emailEditingController.text);
                            // user.email. =value
                            // SharedPreferencesService.saveString(
                            //     Constant.EMAIL, value);
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          controller: _dobEditingController,

                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: Constant.DOB_TEXT_INPUT,
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )
                            ),
                            focusedBorder: OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                          ),
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          onTap: () {
                            TtnFlixDatePicker(context, date: (date) {
                              _dobEditingController.text = date;
                            }).show();
                          },
                          validator: (value) {
                            if ( _dobEditingController.text!.isEmpty) {
                              return Constant.ENTER_VALID_DOB;
                            }
                            SharedPreferencesService.saveSingleString(
                                Constant.DOB,  _dobEditingController.text);
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          controller: _passwordEditingController,
                          obscureText: passwordVisible,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            labelText: Constant.PASSWORD_TEXT_INPUT,
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: const OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                            focusedBorder: const OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
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
                            if (_passwordEditingController.text!.isEmpty) {
                              return Constant.ENTER_VALID_PASSWORD;
                            }
                            SharedPreferencesService.saveSingleString(
                                Constant.PASSWORD, _passwordEditingController.text);
                            return null;
                          },
                        ),
                      ),

                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          obscureText: passwordVisible,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            labelText: Constant.CONFIRM_PASSWORD,
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: const OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
                            focusedBorder: const OutlineInputBorder(  borderSide: BorderSide(
                                color: Colors.blue
                            )),
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
                    ],
                  ),
                  // Female
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),

                        border: Border.all(color: Colors.white)),

                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 5, bottom: 5, right: 5),

                      // padding: const EdgeInsets.all(5.0),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: true,
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: const TextStyle(color: Colors.blue),),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            SharedPreferencesService.saveSingleString(
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
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        width: 300,
                        child: TextButton(
                          onPressed: () => _submit(),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.all(16.0),
                              foregroundColor: Colors.black,
                              textStyle: const TextStyle(fontSize: 20)),
                          child: const Text('   Register   '),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(Constant.LOGIN,style: TextStyle(
                      color: Colors.blue
                    ),),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
