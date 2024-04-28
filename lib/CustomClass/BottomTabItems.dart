import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/BagScreen.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/FavScreen.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/HomeScreen.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/ProfileScreen.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/ShopScreen.dart';
import 'AllColors.dart';
import 'AllDimension.dart';
import 'AllImages.dart';

class BottomTabItems {

  //tab pages
  List<Widget> allBottomPages = [
    HomeScreen(),
    ShopScreen(),
    BagScreen(),
    FavScreen(),
    ProfileScreen()
  ];

  //tabs icons and titles
  List<BottomNavigationBarItem> allTabs(selectedColor) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
            selectedColor==0?AllImages.activeHome:AllImages.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
            selectedColor==1?AllImages.activeCart:AllImages.cart,
        ),
        label: 'Shop',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
            selectedColor==2?AllImages.activeBag:AllImages.bag,
        ),
        label: 'Bag',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
            selectedColor==3?AllImages.activeFav:AllImages.fav,
        ),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
           selectedColor==4?AllImages.activeProfile:AllImages.profile,
        ),
        label: 'Profile',
      ),
    ];
  }
}

