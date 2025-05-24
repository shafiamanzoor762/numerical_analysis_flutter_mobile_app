import 'package:flutter/material.dart';
import 'package:numerical_analysis/screens/linear_eqs_sol/linear_eqs.dart';

class LinearEqsResultScreen extends StatelessWidget {
  final LinearEqsResult result;

  const LinearEqsResultScreen({Key? key, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract the number of columns from the first row
    int len =
        result.data.first.values.first.length + 1; // +1 for the 'k' column
    List<String> columnLabels = ['k'];

    // Add labels for the rest of the columns
    for (int i = 0; i < len - 1; i++) {
      columnLabels.add('X$i');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: columnLabels
                  .map((label) => DataColumn(label: Text(label)))
                  .toList(),
              rows: result.data.map((row) {
                int key = row.keys.first;
                List<dynamic> values = row[key]!;
                return DataRow(
                  cells: [
                    DataCell(Text(key.toString())), // The 'k' column
                    ...values
                        .map((value) => DataCell(Text(value.toString())))
                        .toList(), // The rest of the columns
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Image.network(
              'http://192.168.1.8:8000/media/${result.imageUrl}',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}