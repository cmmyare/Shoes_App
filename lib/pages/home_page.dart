
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoes_app/componants/botton_nav.dart';
import 'package:shoes_app/pages/car_page.dart';
import 'package:shoes_app/pages/profile_page.dart';
import 'package:shoes_app/pages/search_page.dart';
import 'package:shoes_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // control botton nav
  int _selectedIndex = 0;

  // this mothed will update our tapped index when user tapped 
  void NavigateBottonBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  // pages to display
  final List<Widget> _pages = [
         // shop page
       const shopPage(),
         // car page
        carPage(),
        const searchPage( ),
        const profilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottonNavBar(
        onTabChange: (index) => NavigateBottonBar(index) ,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:Builder(
          builder: (context)=> IconButton(
          icon: const Padding(
            padding:  EdgeInsets.only(left: 12.0),
            child:  Icon(
              Icons.menu, 
              color: Colors.black,
              ),
          ),
             onPressed: (){
            Scaffold.of(context).openDrawer();
          }, 
            ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
            children: [
 //logo
            DrawerHeader(
              child: Image.asset('lib/images/nike2.png',
              color: Colors.white,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(color: Colors.grey[800],),
          ),
            // other pages
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,),
                title: Text("Home",style: TextStyle(color: Colors.white),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,),
                title: Text("Favoriate",style: TextStyle(color: Colors.white),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,),
                title: Text("Settings",style: TextStyle(color: Colors.white),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,),
                title: Text("Info",style: TextStyle(color: Colors.white),),
              ),
            ),
            ],
           ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0,bottom: 25.0),
              child: ListTile(
                  leading: Icon(
                  Icons.logout,
                  color: Colors.white,),
                  title: Text("Log out",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}