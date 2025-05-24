import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 50,
      // decoration: BoxDecoration(
      //   color: Colors.blue,
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffdad2f9),),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontFamily: 'ComicNeue',fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
