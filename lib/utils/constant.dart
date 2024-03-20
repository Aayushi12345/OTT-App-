import 'package:flutter/material.dart';

class Constant {
  static const BASE_URL = "https://api.themoviedb.org/3/";
  static const IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w185";
  static const GET_MOVIES =
      "trending/movie/week";
  static const String API_KEY = '060e7c76aff06a20ca4a875981216f3f';
  static const int CAROUSEL_INTERVAL_SEC = 3;
  static const int CAROUSEL_ANIMATION_MILLI = 500;
  static const Duration carouselTimeout = Duration(milliseconds: 3000);
  static const Duration carouselAnimateTimeout = Duration(milliseconds: 500);

  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String NAME = "name";
  static const String TIMMER = "timmer";
  static const String LOGOUTTIME = "logOutTime";

  static const String ONBOARDING = "onboarding";

  static const String DOB = "dob";
  static const String GENDAR = "gendar";

  static const String EMAIL_ID = "Email ID";
  static const String EMAIL_VALIDATION = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String ENTER_VALID_EMAIL = "Enter a valid email!";
  static const String ENTER_VALID_NAME = "Enter a  name!";
  static const String ENTER_VALID_PASSWORD = "Enter a valid password!";
  static const String ENTER_VALID_DOB = "Enter a valid Date of Birth!";
  static const String ENTER_VALID_GENDAR = "Enter a valid gendar!";

  static const String SIGN_UP = "Sign-Up";
  static const String REGISTER_NEW_ACCOUNT = "Create new Account";
  static const String MALE = "Male";
  static const String FEMALE = "Female";
  static const String LOGIN = "Login";
  static const String CONFIRM_PASSWORD = "confirm Password";
  static const String CONFIRM_PASSWORD_TEXT_INPUT = "Confirm Password";
  static const String EMAIL_TEXT_INPUT = "Email";
  static const String PASSWORD_TEXT_INPUT = "Password";
  static const String NAME_TEXT_INPUT = "Name";
  static const String DOB_TEXT_INPUT = "Date of Birth";
  static const String GENDAR_TEXT_INPUT = "Gendar";
  static const String OVERVIEW = "OverView";
  static const String RELEASE_DATE = "Release Date : ";
  static const String RATING = "  Rating : ";
  static const String HOME = "Home";
  static const String PROFILE = "Profile";
  static const String FAVORITE = "Favorite";
  static const String favorite = "Favorite";
  static const String SKIP = "Skip";

}
  class ContanierSize {
  static const double regular = 30.0;
  static const double extraLarge = 120.0;

}
class AppBorderRadius {
  static const double small = 4;
  static const double regular = 8;
  static const double medium = 15;
  static const double large = 20;
  static const double extraLarge = 50;
}

class AppIcons {
  static const home = Icons.home;
  static const account = Icons.account_circle_outlined;
  static const favourites = Icons.favorite_border_outlined;
  static const favouriteFill = Icons.favorite;
  static const edit = Icons.edit;
  static const logout = Icons.logout;
  static const clear = Icons.cleaning_services;
  static const arrow = Icons.chevron_right_rounded;
  static const share = Icons.share;
  static const back = Icons.arrow_back_ios;
  static const password = Icons.password_outlined;
}
class AppIconSize {
  static const double extraSmall = 8;
  static const double small = 12;
  static const double regular = 16;
  static const double large = 20;
  static const double extraLarge = 50;
  static const double logo = 100;
}
class AppColors {
  static const Color primaryColor =  Color(0xffdb0000);
  static const Color whiteTextColor =  Colors.white;
  static const Color ratingColor = Color(0xffffa534);
}
class AppPaddings {
  static const double mini = 4;
  static const double extraSmall = 8;
  static const double small = 12;
  static const double regular = 16;
  static const double large = 20;
}
class AppFontSize {
  static const double small = 12;
  static const double regular = 16;
  static const double large = 20;
  static const double extraLarge = 40;
}
class AppSpacing {
  static const double mini = 4;
  static const double extraSmall = 8;
  static const double small = 12;
  static const double medium = 16;
  static const double regular = 20;
  static const double large = 24;
}