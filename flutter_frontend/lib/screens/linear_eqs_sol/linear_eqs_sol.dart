import 'package:flutter/material.dart';

//Call Root Finding Methods
import 'linear_eqs.dart';
// GUI Display
import '../show_results/linear_eqs_sol_result.dart';

// button
import '../../customWigets/button.dart';

class LinearEqsSolScreen extends StatefulWidget {
  @override
  _LinearEqsSolScreenState createState() => _LinearEqsSolScreenState();
}

class _LinearEqsSolScreenState extends State<LinearEqsSolScreen> {
  // Controller for text fields
  final TextEditingController matrixController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController x0Controller = TextEditingController();
  final TextEditingController wController = TextEditingController();
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
        title: Text('Linear Equations'),
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
                controller: matrixController,
                decoration: InputDecoration(labelText: 'Matrix:'),
              ),
              TextField(
                controller: bController,
                decoration: InputDecoration(labelText: 'Vector:'),
              ),
              TextField(
                controller: x0Controller,
                decoration: InputDecoration(labelText: 'Initial Guess:'),
              ),
              TextField(
                controller: wController,
                decoration: InputDecoration(labelText: 'w(0<w<1):'),
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
                    title: Text('Jacobi'),
                    value: 'jacobi',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Seidal'),
                    value: 'seidal',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Relaxation'),
                    value: 'relaxation',
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
                      matrixController.text,
                      bController.text,
                      x0Controller.text,
                      int.tryParse(nController.text) ?? 0,
                      int.tryParse(wController.text) ?? 0,
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
  void postData(String a, String b, String x0, int n, int w, String method,
      BuildContext context) async {
    print('Matrix: $a, a: $b, b: $x0, n: $n, Method: $method');
    dynamic result;

    if (method == 'jacobi') {
      result = await postMethod(a, b, x0, n, w, method) as JacobiResult?;
    } else if (method == 'seidal') {
      result = await postMethod(a, b, x0, n, w, method) as SeidalResult?;
    } else if (method == 'relaxation') {
      result = await postMethod(a, b, x0, n, w, method) as RelaxationResult?;
    }

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LinearEqsResultScreen(result: result!),
        ),
      );
    } else {
      print('Error: Unable to get the result');
    }
  }

  @override
  void dispose() {
    // Clean up controllers
    matrixController.dispose();
    bController.dispose();
    x0Controller.dispose();
    nController.dispose();
    wController.dispose();
    super.dispose();
  }
}
