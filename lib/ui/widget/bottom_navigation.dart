import 'package:flutter/material.dart';

class BottomNavigation {


  static Widget mainBottomNavigation(Function onItemTapped, int selectedIndex){
    return  BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items:[
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_profile.png", color: Colors.black),
          activeIcon: Image.asset("assets/images/ic_profile.png", color: Colors.green),
          title: Text('Профиль'),
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_marker_position.png", color: Colors.black),
          activeIcon: Image.asset("assets/images/ic_marker_position.png", color: Colors.green),
          title: Text('Позиции'),

        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_scaner.png", color: Colors.black),
          activeIcon: Image.asset("assets/images/ic_scaner.png", color: Colors.green),
          title: Text('Корпоратка'),
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );

  }
}