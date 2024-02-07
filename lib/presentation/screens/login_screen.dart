import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/themes/styles.dart';
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
          backgroundColor: Colors.blue,

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
                  const SizedBox(
                    height: 150,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            labelText: Constant.EMAIL_ID,
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue
                              )
                            ),
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
                            labelText: Constant.PASSWORD_TEXT_INPUT,
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
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
                    ],
                  ),
                  SizedBox(
                    child: Container(
                      width: 300,
                      child: TextButton(
                        onPressed: () => _submit(),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(16.0),
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(fontSize: 20)),
                        child: const Text('   Login   '),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.router.push(const RegisterRoute());
                      },
                      child: const Text(Constant.REGISTER_NEW_ACCOUNT,style: TextStyle(
                        color: Colors.blue
                      ),),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.router.push( HomeRoute());
                      },
                      child: const Text("Skip",style: TextStyle(
                          color: Colors.blue
                      )),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
