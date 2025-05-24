import 'package:flutter/material.dart';

//Call Root Finding Methods
import 'roots.dart';
// GUI Display
import '../show_results/root_finding_result.dart';

// button
import '../../customWigets/button.dart';

class RootFindingScreen extends StatefulWidget {
  @override
  _RootFindingScreenState createState() => _RootFindingScreenState();
}

class _RootFindingScreenState extends State<RootFindingScreen> {
  // Controller for text fields
  final TextEditingController functionController = TextEditingController();
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController nController = TextEditingController();

  // Variable to store selected method
  String selectedMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdad2f9),
        elevation: 2,
        centerTitle: true,
        title: Text('Root Finding'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text fields for input data
              TextField(
                controller: functionController,
                decoration: InputDecoration(labelText: 'Function'),
              ),
              TextField(
                controller: aController,
                decoration: InputDecoration(labelText: 'Initial Guess 1:'),
              ),
              TextField(
                controller: bController,
                decoration: InputDecoration(labelText: 'Initial Guess 2:'),
              ),
              TextField(
                controller: nController,
                decoration: InputDecoration(labelText: 'Number of Iterations:'),
              ),
              SizedBox(height: 20),
              Text('Select method:'),
              // Radio buttons for selecting method
              Column(
                children: [
                  RadioListTile<String>(
                    title: Text('Bisection'),
                    value: 'bisection',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Newton'),
                    value: 'newton',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Secant'),
                    value: 'secant',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Regula Falsi'),
                    value: 'regula_falsi',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Button(
                text: 'Submit',
                onPressed: () {
                  // Call post method based on selected method and input data
                  postData(
                      functionController.text,
                      int.tryParse(aController.text) ?? 0,
                      int.tryParse(bController.text) ?? 0,
                      int.tryParse(nController.text) ?? 0,
                      selectedMethod,
                      context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to handle data posting based on selected method
  void postData(String function, int a, int b, int n, String method,
      BuildContext context) async {
    print('Function: $function, a: $a, b: $b, n: $n, Method: $method');
    dynamic result;

    if (method == 'bisection') {
      result = await postMethod(function, a, b, n, method) as BisectionResult?;
    } else if (method == 'newton') {
      result = await postMethod(function, a, b, n, method) as NewtonResult?;
    } else if (method == 'secant') {
      result = await postMethod(function, a, b, n, method) as SecantResult?;
    } else if (method == 'regula_falsi') {
      result =
          await postMethod(function, a, b, n, method) as RegulaFalsiResult?;
    }

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RootsResultScreen(result: result!),
        ),
      );
    } else {
      print('Error: Unable to get the result');
    }
  }

  @override
  void dispose() {
    // Clean up controllers
    functionController.dispose();
    aController.dispose();
    bController.dispose();
    nController.dispose();
    super.dispose();
  }
}
