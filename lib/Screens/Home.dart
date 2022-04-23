import 'dart:async';
import 'package:akjewellers/Screens/AboutUs.dart';
import 'package:akjewellers/Screens/HelpSupport.dart';
import 'package:akjewellers/Screens/StoreLocation.dart';
import 'package:flutter/material.dart';
import 'package:akjewellers/Screens/Containers/HomeScreen.dart';
import '../colors/MyColors.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {
  bool load;
  int _currentIndex = 0;
  PageController _pageController;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // final screens = [
  //   HomeScreen(),
  //   HomeScreen(),
  //   AboutUs(),
  //   StoreLocation(),
  //   HomeScreen(),
  // ];

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
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30),
              height: 160,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/drawerheader.png"),
                )),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                closeDrawer();
              },
              child: ListTile(
                textColor: _currentIndex == 0 ? Colors.blue : Colors.black,
                iconColor: _currentIndex == 0 ? Colors.blue : Colors.grey,
                title: Text('Home'),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                closeDrawer();
              },
              child: ListTile(
                textColor: _currentIndex == 1 ? Colors.blue : Colors.black,
                iconColor: _currentIndex == 1 ? Colors.blue : Colors.grey,
                title: Text('Shop by Category'),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                closeDrawer();

                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()
                  )
                ).then((value) => {
                  _currentIndex = 0,
                  setState((){

                  })
                });
              },
              child: ListTile(
                textColor: _currentIndex == 2 ? Colors.blue : Colors.black,
                iconColor: _currentIndex == 2 ? Colors.blue : Colors.grey,

                title: Text('About Us'),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
                closeDrawer();

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => StoreLocation()
                )
                ).then((value) => {
                  _currentIndex = 0,
                  setState((){

                  })
                });
              },
              child: ListTile(
                textColor: _currentIndex == 3 ? Colors.blue : Colors.black,
                iconColor: _currentIndex == 3 ? Colors.blue : Colors.grey,
                title: Text('Store Location'),

              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 4;
                });
                closeDrawer();

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HelpSupport()
                )
                ).then((value) => {
                  _currentIndex = 0,
                  setState((){

                  })
                });
              },
              child: ListTile(
                textColor: _currentIndex == 4 ? Colors.blue : Colors.black,
                iconColor: _currentIndex == 4 ? Colors.blue : Colors.grey,

                title: Text('Help and Support'),
              ),
            ),
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }

  void closeDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) Navigator.of(context).pop();
  }
}
