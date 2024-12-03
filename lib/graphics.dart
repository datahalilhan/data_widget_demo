import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';



class MultiChartPage extends StatelessWidget {
  // Veriler
  final List<Map<String, dynamic>> areaChartData = [
    {'month': 'Ocak', 'sales': 36},
    {'month': 'Şubat', 'sales': 18},
    {'month': 'Mart', 'sales': 25},
    {'month': 'Nisan', 'sales': 29},
    {'month': 'Mayıs', 'sales': 27},
    {'month': 'Haziran', 'sales': 32},
  ];

  final List<Map<String, dynamic>> lineChartData = [
    {'day': 'Pazartesi', 'temperature': 20},
    {'day': 'Salı', 'temperature': 22},
    {'day': 'Çarşamba', 'temperature': 18},
    {'day': 'Perşembe', 'temperature': 24},
    {'day': 'Cuma', 'temperature': 26},
  ];

  final List<Map<String, dynamic>> barChartData = [
    {'category': 'A', 'value': 50},
    {'category': 'B', 'value': 70},
    {'category': 'C', 'value': 40},
    {'category': 'D', 'value': 90},
  ];

  final List<Map<String, dynamic>> pieChartData = [
    {'type': 'Mobil', 'share': 40},
    {'type': 'Web', 'share': 30},
    {'type': 'Desktop', 'share': 30},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farklı Grafikler'),
        
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildSectionTitle('Area Chart (Satış Verileri)'),
          SizedBox(
            height: 300,
            width: 200,
            child: buildAreaChart()),
          SizedBox(height: 16),
          buildSectionTitle('Line Chart (Sıcaklık)'),
          SizedBox(
             height: 300,
            width: 200,
            child: buildLineChart()),
          SizedBox(height: 16),
          buildSectionTitle('Bar Chart (Kategori Değerleri)'),
          SizedBox(
             height: 300,
            width: 200,
            child: buildBarChart()),
          SizedBox(height: 16),
         /* SizedBox(
             height: 300,
            width: 200,
            child: buildPieChart()),*/
        ],
      ),
    );
  }

  // Area Chart
  Widget buildAreaChart() {
    return SizedBox(
      height: 200,
      child: Chart(
        data: areaChartData,
        variables: {
          'month': Variable(
            accessor: (Map map) => map['month'] as String,
          ),
          'sales': Variable(
            accessor: (Map map) => map['sales'] as num,
          ),
        },
        marks: [
        AreaMark(
            shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
            color: ColorEncode(value: Colors.blueAccent.withOpacity(0.5)),
          ),
          LineMark(
            shape: ShapeEncode(value: BasicLineShape(smooth: true)),
            size: SizeEncode(value: 2),
            color: ColorEncode(value: Colors.blue),
          ),
        ],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
      ),
    );
  }

  // Line Chart
  Widget buildLineChart() {
    return SizedBox(
      height: 200,
      child: Chart(
        data: lineChartData,
        variables: {
          'day': Variable(
            accessor: (Map map) => map['day'] as String,
          ),
          'temperature': Variable(
            accessor: (Map map) => map['temperature'] as num,
          ),
        },
        marks: [
          LineMark(
            shape: ShapeEncode(value: BasicLineShape(smooth: true)),
            size: SizeEncode(value: 2),
            color: ColorEncode(value: Colors.red),
          ),
        ],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
      ),
    );
  }

  // Bar Chart
  Widget buildBarChart() {
    return SizedBox(
      height: 200,
      child: Chart(
        data: barChartData,
        variables: {
          'category': Variable(
            accessor: (Map map) => map['category'] as String,
          ),
          'value': Variable(
            accessor: (Map map) => map['value'] as num,
          ),
        },
        marks: [
          IntervalMark(
            color: ColorEncode(value: Colors.green),
          ),
        ],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
      ),
    );
  }

  // Pie Chart
  Widget buildPieChart() {
    return SizedBox(
      height: 200,
      child: Chart(
        data: pieChartData,
        variables: {
          'type': Variable(
            accessor: (Map map) => map['type'] as String,
          ),
          'share': Variable(
            accessor: (Map map) => map['share'] as num,
          ),
        },
        marks: [
          IntervalMark(
            position: Varset('share') / Varset('type'),
            label: LabelEncode(
              encoder: (tuple) => Label(tuple['type']),
            ),
            color: ColorEncode(
              variable: 'type',
              values: [Colors.orange, Colors.purple, Colors.cyan],
            ),
          ),
        ],
        coord: PolarCoord(transposed: true),
      ),
    );
  }

  // Section Başlığı
  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
