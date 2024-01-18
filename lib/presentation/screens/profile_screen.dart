import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);
  UserResponse user = UserResponse();

  Future<UserResponse> MyUserData() async {
  user.imgUrl = "assets/images/woman_female_avatar.png";
    String? email = await SharedPreferencesService.getString(Constant.EMAIL);
    String? name = await SharedPreferencesService.getString(Constant.NAME);
    String? password =
        await SharedPreferencesService.getString(Constant.PASSWORD);
    String? gendar = await SharedPreferencesService.getString(Constant.GENDAR);
    user.email = email;
    user.name = name;
    user.password = password;
    user.gendar = gendar;
    if(gendar == Constant.MALE)
      {
        user.imgUrl = "assets/images/man_avatar_male.png";
      }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserResponse>(
        future: MyUserData(),
        builder: (context, snapshot) {
          return MaterialApp(
              home: Scaffold(
                  appBar: AppBar(
                    centerTitle: false,
                    title: Text(


                        "Profile Screen"),
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 50, // Image radius
                                  backgroundImage: AssetImage(
                                      user.imgUrl.toString() ),
                                  // backgroundColor: Colors.greenAccent,
                                ),
                                SizedBox(width: 20),
                                Column(children: [
                                  Text(user.name.toString(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.00,
                                          fontWeight: FontWeight.bold)),
                                  Text(user.email.toString(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.00,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(user.dob.toString(),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20.00,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start),
                                GestureDetector(
                                  onTap: () {
                                    ShowBottomBar(context);
                                  }, // Image tapped
                                  child: Image.asset(
                                    'assets/images/pen.png',
                                    fit: BoxFit.cover, // Fixes border issues
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Text(user.gendar.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.00,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Text("*****",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.00,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  )));
        });
  }

  Future ShowBottomBar(BuildContext context) {
    String updatedDOB = "";

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Update Dob',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      onChanged: (newText) {
                        updatedDOB = newText;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        SharedPreferencesService.saveString(
                            Constant.DOB, updatedDOB);
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.all(16.0),
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(fontSize: 20)),
                      child: Text('   Add   '),
                    ),
                  ),
                ],
              )),
            ));
  }
}
