import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()  {
    super.initState();

    Timer(const Duration(seconds: 3),
            ()=>checkValidation()
        //         Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder:
        //         (context) =>
        //         checkValidation()
        //     )
        // )
    );

  }
  checkValidation() async{
    String? passwordValue =
        await SharedPreferencesService.getSingleString(Constant.PASSWORD);
    bool? onBoarding =
    await SharedPreferencesService.getBool(Constant.ONBOARDING);
    bool? logOutTIME =
    await SharedPreferencesService.getBool(Constant.LOGOUTTIME);

    if(passwordValue==null)
      {
        if(onBoarding==true)
          {
            context.router.push(const LoginRoute());
          }
        else{
          context.router.push(const OnboardingRoute());
        }
      }
    else
      {
        if(passwordValue!=null)
          {
            if(logOutTIME==true)
              {
                context.router.push(const LoginRoute());


              }
          }
        context.router.push(HomeRoute());
      }
  }
  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: Image.asset(
          'assets/images/ott.png',
          fit: BoxFit.fitHeight,
          width: double.infinity,
          height: double.infinity,

        ),

    );
  }
  getTimeDifference() async
  {
    int maxLimit = 15;
    String? getCurrentTime =
        await SharedPreferencesService.getSingleString(Constant.TIMMER);
    String currentTime =  TimeOfDay.fromDateTime(DateTime.now()).format(context).trim();

    DateTime startDate = DateFormat("hh:mm a").parse(getCurrentTime!);
    DateTime endDate = DateFormat("hh:mm a").parse(currentTime);
    Duration dif = endDate.difference(startDate);
    debugPrint(dif.toString());
    debugPrint(dif.inMinutes.toString());
    debugPrint(dif.inHours.toString());
    if(dif.inMinutes <= maxLimit)
      {

        SharedPreferencesService.saveBool(
            Constant.LOGOUTTIME, true);
        // SharedPreferencesService.clearData();
      }
    // 12:00:00.000000
    print(dif.inHours);
  }

}
