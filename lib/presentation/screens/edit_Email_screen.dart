import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class EditEmailScreen extends StatelessWidget {
  final TextEditingController _nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    void _submit() async {
      SharedPreferencesService.saveSingleString(
          Constant.EMAIL, _nameEditingController.text);
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      Navigator.pop(context);
      _formKey.currentState!.save();
    }

    UserResponse user = UserResponse();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Update Email"),
        ),
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      // padding: new EdgeInsets.all(20.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: _nameEditingController,
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
                                  return Constant.ENTER_VALID_EMAIL;
                                }
                                user.email = value.toString();
                                return null;
                              },
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              color: Colors.white,
                              child: const Text(Constant.EMAIL_TEXT_INPUT),
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
                          child: Text('   Update Email   '),
                        ),
                      ),
                    ),
                  ])),
        )),
      ),
    );
  }
}
