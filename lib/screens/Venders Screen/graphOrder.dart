import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphOrder extends StatelessWidget {
  const GraphOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: AspectRatio(
        aspectRatio: 1.3,
        child: GestureDetector(
          onTap: () {
            _showDetailsDialog(context);
          },
          child: PieChart(
            PieChartData(
              sections: getSections(),
              centerSpaceRadius: 60,
              startDegreeOffset: 190,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pie Chart Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final section in getSections())
                ListTile(
                  title: Text(
                    section.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: section.color,
                    ),
                  ),
                  trailing: Text(
                    '${section.value.toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  List<PieChartSectionData> getSections() {
    List<PieChartSectionData> sections = [
      PieChartSectionData(
        color: Colors.blue,
        value: 25,
        title: 'Client\n25%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 35,
        title: 'Orders\n35%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 20,
        title: 'Projects Done\n20%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 10,
        title: 'Orders\n10%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 5,
        title: 'Sales\n5%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ];

    return sections;
  }
}
