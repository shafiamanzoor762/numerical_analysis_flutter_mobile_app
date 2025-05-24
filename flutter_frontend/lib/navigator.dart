
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner:false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400),
//         useMaterial3: true,
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var arrNames=['Ali','Alina','Aliya','Alixa','Aliza','Alaiza'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Container'),
//       ),
//       body:Container(
//         alignment: Alignment.center,
//         color: Colors.black,
//         height: 600,width: 350,
//         child: Row(
//           children: [
//            Container(
//              child:const Text('werfgwys',style: TextStyle(fontSize: 20),),
//            ),
//           ],
//         ),
//       ),
//     );// This trailing comma makes auto-formatting nicer for build methods
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:ui';
//Screens
import '../screens/home.dart';
import '../screens/numerical_analysis.dart';
import '../screens/profile.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex=0;
  List<Widget> _screens=[
    const HomeScreen(),
    const NumericalAnalysisScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
    return SafeArea(
        child:
        Scaffold(
          body: Container(
              color: Colors.blueAccent,
                  width:double.infinity,
                  height:double.infinity,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: _screens[_selectedIndex],
                    ),
                  ],
                ),
              )
          ),
          extendBody: true,
          backgroundColor: Color(0xff8878c3),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _selectedIndex,
            animationDuration: Duration(milliseconds: 200),
            backgroundColor: Color(0xff8878c3),
            color: Color(0xffdad2f9),
            items: [
              Icon(Icons.home, color: Colors.deepPurple,size:30,),
              Icon(Icons.explore, color: Colors.deepPurple,size:30,),
              Icon(Icons.account_circle_rounded, color: Colors.deepPurple,size:30,)
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        )
    );
  }
}
