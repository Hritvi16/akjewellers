import 'dart:async';
import 'package:flutter/material.dart';
import 'package:akjewellers/Screens/Containers/HomeScreen.dart';
import '../colors/MyColors.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _State();
}

class _State extends State<CategoryList> {
  bool load;
  int _currentIndex = 0;
  PageController _pageController;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState()
  {
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mGray2,
        title: Image.asset('assets/drawericon.png',height:50 ,),
        iconTheme:IconThemeData(color: MyColors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {

            },
          ),
          
        ],
      ),
      body:HomeScreen(),
    );
  }

  void closeDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) Navigator.of(context).pop();
  }
}
