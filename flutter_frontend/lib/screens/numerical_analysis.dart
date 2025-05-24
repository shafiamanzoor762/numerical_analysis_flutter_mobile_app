import 'package:flutter/material.dart';

import '../customWigets/button.dart';
import 'root_finding/root_finding.dart';
import 'linear_eqs_sol/linear_eqs_sol.dart';

class NumericalAnalysisScreen extends StatelessWidget {
  const NumericalAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdad2f9),
          elevation: 2,
          title: Text("Numerical Analysis"),
          centerTitle: true,
        ),
        body: Container(
            color: Color(0xff8878c3),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/image4.jpg',
                    // width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Button(
                    text: 'Root Finding Methods',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RootFindingScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/image4.jpg',
                    // width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Button(
                    text: 'System Of Linear Equations',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LinearEqsSolScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/image4.jpg',
                    // width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Button(
                    text: 'Numerical Integration Methods',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RootFindingScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )),
      ),
    );
  }
}
