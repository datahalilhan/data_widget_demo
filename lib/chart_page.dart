import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Grafik Listesi')),
        body: ListView(
          children: [
            SizedBox(
              height: 300,
              width: 200,
              child: AreaChartPage(),
            ),
            _buildSectionTitle('Çizgi Grafiği'),
            SizedBox(
              height: 300,
              width: 200,
              child: _buildLineChart()),
            _buildSectionTitle('Sütun Grafiği'),
            SizedBox(
              height: 300,
              width: 200,
              child: _buildBarChart()),
            _buildSectionTitle('Pasta Grafiği'),
            SizedBox(
              height: 300,
              width: 200,
              child: _buildPieChart()),
            _buildSectionTitle('Radar Grafiği'),
            SizedBox(
              height: 300,
              width: 200,
              child: _buildRadarChart()),
          ],
        ),
      
    );
  }
}
  // Başlık Bölümü
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Çizgi Grafiği
  Widget _buildLineChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8),
      child: SfCartesianChart(
        enableAxisAnimation: true,
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Satış Analizi'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          LineSeries<SalesData, String>(
            dataSource: [
              SalesData('Ocak', 35),
              SalesData('Şubat', 28),
              SalesData('Mart', 34),
              SalesData('Nisan', 32),
              SalesData('Mayıs', 40),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: 'Satış',
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  // Sütun Grafiği
  Widget _buildBarChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Aylık Gelir Dağılımı'),
        series: [
          ColumnSeries<SalesData, String>(
            dataSource: [
              SalesData('Ocak', 5000),
              SalesData('Şubat', 7000),
              SalesData('Mart', 6000),
              SalesData('Nisan', 8000),
              SalesData('Mayıs', 9000),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  // Pasta Grafiği
  Widget _buildPieChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8),
      child: SfCircularChart(
        title: ChartTitle(text: 'Pazar Payı Analizi'),
        legend: Legend(isVisible: true),
        series: <PieSeries<SalesData, String>>[
          PieSeries<SalesData, String>(
            dataSource: [
              SalesData('Firma A', 35),
              SalesData('Firma B', 28),
              SalesData('Firma C', 34),
              SalesData('Firma D', 32),
            ],
            xValueMapper: (SalesData data, _) => data.year,
            yValueMapper: (SalesData data, _) => data.sales,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  // Radar Grafiği
  Widget _buildRadarChart() {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8),
      child: SfCircularChart(
        title: ChartTitle(text: 'Performans Değerlendirme'),
        series: <RadialBarSeries<SalesData, String>>[
          RadialBarSeries<SalesData, String>(
            dataSource: [
              SalesData('Hız', 75),
              SalesData('Güvenlik', 85),
              SalesData('Kullanılabilirlik', 95),
              SalesData('Performans', 90),
            ],
            xValueMapper: (SalesData data, _) => data.year,
            yValueMapper: (SalesData data, _) => data.sales,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }


// Veri Modeli
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}



class AreaChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      enableAxisAnimation: true,
      title: ChartTitle(text: 'Satış Verileri (2023)'),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Aylar'),
        edgeLabelPlacement: EdgeLabelPlacement.shift, // Kenar boşluklarını kaldırır
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Satış Miktarı'),
        labelFormat: '{value}K',
      ),
      series: [
        AreaSeries<SalesData1, String>(
          
          name: 'Satış',
          dataSource: getChartData1(),
          xValueMapper: (SalesData1 data, _) => data.month,
          yValueMapper: (SalesData1 data, _) => data.sales,
          color: Colors.blueAccent.withOpacity(0.5),
          borderColor: Colors.blue,
          //borderWidth: 2,
          
        ),
      ],
    );
  }

  // Grafik verileri
  List<SalesData1> getChartData1() {
    return [
      SalesData1('Ocak', 36),
      SalesData1('Şubat', 18),
      SalesData1('Mart', 25),
      SalesData1('Nisan', 29),
      SalesData1('Mayıs', 27),
      SalesData1('Haziran', 32),
    ];
  }
}

class SalesData1 {
  SalesData1(this.month, this.sales);
  final String month;
  final double sales;
}
