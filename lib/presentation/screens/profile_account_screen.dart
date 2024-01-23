import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class ProfileAccountScreen extends StatefulWidget {
  const ProfileAccountScreen({super.key});

  @override
  State<ProfileAccountScreen> createState() => _ProfileAccountScreenState();
}


class _ProfileAccountScreenState extends State<ProfileAccountScreen> {
  UserResponse user = UserResponse();

  @override
  void initState() {
    MyUserData();
    super.initState();
  }

  MyUserData() async {
    user.imgUrl = "assets/images/woman_female_avatar.png";
    String? email = await SharedPreferencesService.getString(Constant.EMAIL);
    debugPrint(email);

    String? name = await SharedPreferencesService.getString(Constant.NAME);
    String? password =
        await SharedPreferencesService.getString(Constant.PASSWORD);
    String? gendar = await SharedPreferencesService.getString(Constant.GENDAR);
    String? dob = await SharedPreferencesService.getString(Constant.DOB);

    user.email = email;
    user.name = name;
    user.password = password;
    user.gendar = gendar;
    user.dob=dob;
    if (gendar == Constant.MALE) {
      user.imgUrl = "assets/images/man_avatar_male.png";
    }
    setState(() { });
  }

  void getData(String updatedEmail)  {
    setState(() async {
      debugPrint("mnbvc" + updatedEmail.toString());
      String? email = await SharedPreferencesService.getString(Constant.EMAIL);

      user.email = email;
    });
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("Profile Screen"),
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
                            backgroundImage: AssetImage(user.imgUrl.toString()),
                            // backgroundColor: Colors.greenAccent,
                          ),
                          SizedBox(width: 20),
                          Column(children: [
                            Text(user.name.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.00,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Text(user.email.toString(),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.00,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 50,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var updatedEmail =
                                       await context.pushRoute(EditEmailRoute());
                                    MyUserData();
                                    // getData(updatedEmail.toString());
                                  },
                                  // Image tapped
                                  child: Image.asset(
                                    'assets/images/pen.png',
                                    fit: BoxFit.cover,
                                    // Fixes border issues
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                )
                              ],
                            )
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
                      Text(user.dob.toString(),
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.00,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start),
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
  }
}
