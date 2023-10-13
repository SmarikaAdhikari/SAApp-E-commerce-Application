// ignore_for_file: prefer_const_constructors

// import 'package:app/publisher/pubprofile.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PubstatsPage extends StatefulWidget {
  const PubstatsPage({super.key});

  @override
  State<PubstatsPage> createState() => _PubstatsPageState();
}

class _PubstatsPageState extends State<PubstatsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Profit"),
      ),
      body: Column(
        children: [
         const  SizedBox(height: 10),
         const Text("Product Stock", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Row(
          children: [
            SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: <ChartData>[
                  ChartData('Category A', 20, const Color.fromARGB(255, 0, 204, 255)),
                  ChartData('Category B', 15, const Color.fromARGB(255, 134, 134, 33)),
                  ChartData('Category C', 15, Color.fromARGB(255, 183, 122, 122)),
                  ChartData('Category D', 25, const Color.fromARGB(255, 187, 92, 199)),
                  ChartData('Category D', 15, const Color.fromARGB(255, 244, 147, 20)),
                  ChartData('Category D', 10, const Color.fromARGB(255, 117, 241, 156)),
              ],
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
      ],
      ),
      Container(
        width: 90,
        height: 120,
        color: Colors.white,
        child: const Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            ColoredBox(color:  Color.fromARGB(255, 0, 204, 255), child:  Text("Fiction")),
            ColoredBox(color: Color.fromARGB(255, 134, 134, 33), child:  Text("Non-Fiction")),
            ColoredBox(color:  Color.fromARGB(255, 161, 108, 108), child:  Text("Literature")),
            ColoredBox(color: Color.fromARGB(255, 187, 92, 199), child:  Text("ROMANCE")),
            ColoredBox(color: Color.fromARGB(255, 244, 147, 20), child:  Text("Science")),
            ColoredBox(color: Color.fromARGB(255, 117, 241, 156), child:  Text("Others"))
          ],
        ),
      )
          ],
        ),
      //  const SizedBox(height: 10),
        const Text("Order Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 100,
            interval: 20,
            // numberFormat: NumberFormat.decimalPercentPattern(decimalDigits: 0),
          ),
          series: <ChartSeries>[
            StackedBar100Series<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('Delivered', 30,const Color.fromARGB(255, 0, 152, 127)),
                SalesData('Shipped', 50,const Color.fromARGB(255, 232, 232, 178)),
                SalesData('Pending', 70,const Color.fromARGB(255, 121, 2, 24)),
              
              ],
              xValueMapper: (SalesData sales, _)=> sales.category,
              yValueMapper: (SalesData sales, _) => sales.value,
           pointColorMapper: (SalesData sales, _) => sales.color,
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),

   ] ),);
  }
}

class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}
class SalesData {
  SalesData(this.category, this.value,this .color);
  final String category;
  final double value;
  final Color color;
}