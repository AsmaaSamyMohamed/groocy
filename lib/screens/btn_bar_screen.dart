
import 'package:flutter/material.dart';
import 'package:groocy/screens/home_screen.dart';
import 'package:groocy/screens/user.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../provider/dark_thems_prefs.dart';
import 'cart/card.dart';
import 'catogries.dart';
class bottomBarScreen extends StatefulWidget {
  const bottomBarScreen({Key? key}) : super(key: key);

  @override
  State<bottomBarScreen> createState() => _bottomBarScreenState();
}

class _bottomBarScreenState extends State<bottomBarScreen> {
  int _selectIndex=0;
  final List<Map<String , dynamic>> _pages=[
    {'page': const homeScreen(),      'title':"home screen",},
    {'page':  catogriesScreen(), 'title':"categry screen",},
    {'page': const CardScreen(),      'title':"card screen",},
    {'page': const UserScreen(),      'title':"user screen",},
  ];

  void _selectPage(int index){
    setState(() {
      _selectIndex =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemsProvider>(context);
    bool _isDark =themeState.getDarkThems;
    return Scaffold(

      body: _pages[_selectIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectIndex,
        unselectedItemColor: _isDark ? Colors.white10:Colors.black12,
        selectedItemColor:_isDark ? Colors.lightBlue.shade200:Colors.black ,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_selectIndex ==0 ?IconlyBold.home: IconlyLight.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectIndex ==1 ? IconlyBold.category: IconlyLight.category),
            label: "category"
          ),
          BottomNavigationBarItem(
              icon: Icon(_selectIndex ==2 ? IconlyBold.buy: IconlyLight.buy),
              label: "card"
          ),
          BottomNavigationBarItem(
              icon: Icon(_selectIndex ==3 ? IconlyBold.user_2: IconlyLight.user),
              label: "people"
          ),

        ],
      ),
    );
  }
}
