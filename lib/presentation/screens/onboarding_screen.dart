import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        Expanded(
          child: Image.asset(
                'assets/images/ot.jpg',
          fit: BoxFit.fitHeight,
            width: double.infinity,
            height: double.infinity,

          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            child: Container(

              width: 400,
              child: TextButton(
                onPressed: () => {
                  SharedPreferencesService.saveBool(
                      Constant.ONBOARDING, true),
                  context.router.push(LoginRoute()),
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 20)),
                child: const Text('   Lets Start   '),
              ),
            ),
          ),
        ),

      // ],
      //
      //   child:
      //     // child: Center(
      //     //   child: SizedBox(
      //     //     child: Container(
      //     //       width: 300,
      //     //       child: TextButton(
      //     //         onPressed: () => {
      //     //           SharedPreferencesService.saveBool(
      //     //               Constant.ONBOARDING, true),
      //     //           context.router.push(LoginRoute()),
      //     //         },
      //     //         style: TextButton.styleFrom(
      //     //             backgroundColor: Colors.blue,
      //     //             padding: const EdgeInsets.all(16.0),
      //     //             foregroundColor: Colors.black,
      //     //             textStyle: const TextStyle(fontSize: 20)),
      //     //         child: const Text('   Lets Start   '),
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //     // SizedBox(
      //     //   height: 50,
      //     // )

    ]
      ),
    );
  }
}
