import 'package:datahome_customer_demo/graphics.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home:MultiChartPage() // BilgiBankasiPage()
    );
  }
}

class AreaChartPage extends StatelessWidget {
  // Trafik verisi
  final List<Map<String, dynamic>> trafficData = [
    {'time': '17:20', 'traffic': 1000},
    {'time': '17:30', 'traffic': 2000},
    {'time': '17:40', 'traffic': 1500},
    {'time': '17:50', 'traffic': 2500},
    {'time': '18:00', 'traffic': 2200},
  ];

  // Oturum verisi
  final List<Map<String, dynamic>> sessionData = [
    {'time': '17:20', 'session': 20},
    {'time': '17:30', 'session': 30},
    {'time': '17:40', 'session': 25},
    {'time': '17:50', 'session': 40},
    {'time': '18:00', 'session': 35},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trafik ve Oturum Area Chart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chart(
          data: [
            ...trafficData.map((e) => {
                  'time': e['time'],
                  'traffic': e['traffic'],
                  'session': sessionData
                      .firstWhere((se) => se['time'] == e['time'])['session']
                })
          ],
          variables: {
            'time': Variable(
              accessor: (Map map) => map['time'] as String,
            ),
            'traffic': Variable(
              accessor: (Map map) => map['traffic'] as num,
            ),
            'session': Variable(
              accessor: (Map map) => map['session'] as num,
            ),
          },
          marks: [
            // Trafik için AreaElement
            AreaMark(
              shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
              color: ColorEncode(value: Colors.blue.withOpacity(0.5)),
            ),
            // Oturum için AreaElement
            AreaMark(
              shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
              color: ColorEncode(value: Colors.orange.withOpacity(0.5)),
            ),
          ],
          axes: [
            Defaults.horizontalAxis,
            Defaults.verticalAxis,
          ],
        ),
      ),
    );
  }
}