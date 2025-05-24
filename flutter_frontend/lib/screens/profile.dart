import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key?key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdad2f9),
          elevation: 2,
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: Container(
            color: Color(0xff8878c3),
            width:double.infinity,
            height:double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            )
        ),
      ),
    );
  }
}