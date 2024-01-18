import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
   ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    // Future<String?> email = SharedPreferencesService.getString(Constant.EMAIL);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,

              title: Text("Profile Screen"),
            ),
            body:  SafeArea(
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
                                'assets/images/woman_female_avatar.png'),
                            // backgroundColor: Colors.greenAccent,
                          ),
                          SizedBox(width: 20),
                          Column(children: [

                            Text("Name",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.00,
                                    fontWeight: FontWeight.bold)),
                            // SizedBox(height: 10),
                            Text("aa@gmail.com ",
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
                          Text("10/07/1981",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.00,
                                  fontWeight: FontWeight.bold),textAlign: TextAlign.start),

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
                      Text("Female",
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
     'Add Task',
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
       padding:  EdgeInsets.all(8.0),
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
