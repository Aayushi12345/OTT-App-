import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Profile Screen"),
            ),
            body: const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
Row(
  children: [
    CircleAvatar(
                radius: 48, // Image radius
                  backgroundImage: NetworkImage('imageUrl'),
                )
  ],
)


                    ]),
              ),
            )));
  }
}
