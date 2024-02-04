import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  String email = "";
  String password = "";

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    String? emailValue =
        await SharedPreferencesService.getSingleString(Constant.EMAIL);
    String? passwordValue =
        await SharedPreferencesService.getSingleString(Constant.PASSWORD);

    if (!isValid) {
      return;
    }
    if (password == passwordValue) {
      debugPrint(email);
      context.router.push(HomeRoute());
    } else {
      var snackBar = const SnackBar(content: Text('Create A aacount'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          title: const Center(child: Text(Constant.LOGIN)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                              labelText: Constant.EMAIL_ID,
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
                                // set username(String value) => SharedPreferencesService_saveData(_kUsernameKey, value);

                                // sharedPreferences.sa
                                return Constant.ENTER_VALID_EMAIL;
                              }
                              // user.email.toString() =value.toString()
                              email = value;
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
                            child: const Text(Constant.EMAIL_TEXT_INPUT),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
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
                              password = value;
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
                    margin: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.router.push(const RegisterRoute());
                      },
                      child: Text(Constant.REGISTER_NEW_ACCOUNT),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.router.push( HomeRoute());
                      },
                      child: Text("SKip"),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
