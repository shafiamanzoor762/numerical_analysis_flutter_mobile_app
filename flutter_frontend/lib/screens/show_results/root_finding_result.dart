import 'package:flutter/material.dart';
import '../root_finding/roots.dart';

class RootsResultScreen extends StatelessWidget {
  final RootFindingResult result;

  const RootsResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> columnLabels = [];
    if (result is BisectionResult || result is RegulaFalsiResult) {
      columnLabels = ['n', 'Xn-1', 'Xn', 'Xn+1', 'f(Xn+1)', 'Error'];
    } else if (result is NewtonResult) {
      columnLabels = ['n', 'Xn', 'Error'];
    } else if (result is SecantResult) {
      columnLabels = ['n', 'Xn-1', 'Xn', 'Xn+1', 'Error'];
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
              rows: result.data
                  .map(
                    (row) => DataRow(
                      cells: row
                          .map(
                            (cell) => DataCell(Text(cell.toString())),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
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
