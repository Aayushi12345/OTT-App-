import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/logic/wishList/wishlist_cubit.dart';
import 'package:ott_app/presentation/screens/Favorite_screen.dart';
import 'package:ott_app/presentation/screens/home_screen.dart';
import 'package:ott_app/presentation/screens/profile_account_screen.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class BottomTabScreen extends StatefulWidget {
  @override
  State<BottomTabScreen> createState() => _BottomTabScreen();

  const BottomTabScreen({super.key});
}

class _BottomTabScreen extends State<BottomTabScreen> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    BlocProvider(
        create: (context) => MovieCubit(Repository())..fetchMoviesData(1),
        child: HomeScreen()),
    BlocProvider(
        create: (context) => WishListCubit()..fetchFavouritesData(), child: const FavoriteScreen()),
    const ProfileAccountScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Favourites"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp), label: "Account"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.redAccent,
      backgroundColor:Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: _bottomBar());
  }
}
