import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';
import 'package:ott_app/utils/context_extention.dart';

@RoutePage()
class UpdateNameScreen extends StatelessWidget {
  final String name ;
  final TextEditingController _nameEditingController = TextEditingController();

   UpdateNameScreen({super.key, required this.name});
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    void _submit() async {
      SharedPreferencesService.saveSingleString(
          Constant.NAME, _nameEditingController.text);
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

          title: Text("Update Name"),
        ),
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  width: context.isSmallScreen ? context.width : context.width/2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: context.isSmallScreen ? context.width : context.width/2,

                          // decoration: BoxDecoration(color: Colors.white),
                          // padding: new EdgeInsets.all(20.0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.blue),
                                  controller: _nameEditingController,
                                  textAlign: TextAlign.start,
                                  decoration: const InputDecoration(
                                    labelText: Constant.NAME_TEXT_INPUT,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return name;
                                    }
                                    user.name = value.toString();
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(

                          child: Center(
                            child: SizedBox(
                              width: 300,
                              child: TextButton(
                                onPressed: () => _submit(),
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.all(16.0),
                                    foregroundColor: Colors.black,
                                    textStyle: const TextStyle(fontSize: 20)),
                                child: Text('   Update Name   '),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )),
          ),
        )),

    );
  }
}
