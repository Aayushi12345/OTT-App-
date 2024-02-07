import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';
import 'package:ott_app/utils/ttn_flix_date_picker.dart';

@RoutePage()
class UpdateDobScreen extends StatelessWidget {
  final TextEditingController _dobEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    void _submit() async {
      SharedPreferencesService.saveSingleString(
          Constant.DOB, _dobEditingController.text);
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      Navigator.pop(context);
      _formKey.currentState!.save();
    }

    UserResponse user = UserResponse();

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.blue,

          title: Text("Update Date of Birth"),
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
                      // padding: new EdgeInsets.all(20.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.blue),

                              controller: _dobEditingController,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                labelText: Constant.DOB_TEXT_INPUT,
                                labelStyle: TextStyle(
                                  color: Colors.blue,
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
                              onTap: () {
                                TtnFlixDatePicker(context, date: (date) {
                                  _dobEditingController.text = date;
                                }).show();
                              },
                              validator: (value) {
                                if (_dobEditingController.text!.isEmpty
                                   ) {
                                  return Constant.ENTER_VALID_DOB;
                                }
                                user.dob = value.toString();
                                return null;
                              },
                            ),
                          ),
                          // Positioned(
                          //   left: 10,
                          //   top: 3,
                          //   child: Container(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 3),
                          //     color: Colors.white,
                          //     child: const Text(Constant.DOB_TEXT_INPUT),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(

                      child: Center(
                        child: Container(
                          width: 300,
                          child: TextButton(
                            onPressed: () => _submit(),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.all(16.0),
                                foregroundColor: Colors.black,
                                textStyle: TextStyle(fontSize: 20)),
                            child: Text('   Update DOB   '),
                          ),
                        ),
                      ),
                    ),
                  ])),
        )),

    );
  }
}
