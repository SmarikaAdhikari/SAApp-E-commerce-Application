import 'package:app/admin/Pages/profit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
 
    
    
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Dashboard",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 1.7,
                crossAxisSpacing: 0,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return const Card(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.people),
                          SizedBox( width: 10,),
                          Column(
                            children: [
                              SizedBox(height: 22,),
                              Text("2345"),
                               SizedBox(height: 5,),
                              Text("Data"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 6,
            ),
            const SizedBox(height: 20),
            const Text("Revenue",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
         SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            SplineAreaSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('Jan', 35),
                SalesData('Feb', 28),
                SalesData('Mar', 34),
                SalesData('Apr', 32),
                SalesData('May', 23),
                SalesData('June', 34),
                SalesData('July', 45),
                SalesData('Aug', 35),
                SalesData('Sep', 30),
                SalesData('Oct', 25),
                SalesData('Nov', 30),
                SalesData('Dec', 45),
               
              ],
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.sales,
            ),
          ],
        ),
          ElevatedButton(
            onPressed: () => Get.to( const ProfitPage()),
            child: const Text("Price",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
      
          ],
        ),
      ),
    );
  }
}
class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}
    