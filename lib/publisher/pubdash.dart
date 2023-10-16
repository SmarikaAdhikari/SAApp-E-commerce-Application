
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/publisher/publish.dart';
import 'package:app/publisher/ordered.dart';
import 'package:app/publisher/pubstat.dart';
import 'package:app/user/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PubProfilePage extends ConsumerWidget {
  const PubProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final dashboard = ref.watch(dashboardProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius:20.0,
            backgroundColor: Colors.yellow,
            backgroundImage: AssetImage("pics/daisy.jpeg"),
          ),
        ),
        title: const Center(
            child: Text("Publisher name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const OrderedPage());
            },
            icon: const Icon(Icons.list),
            iconSize: 25,
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text("Dashboard",
              style: TextStyle(
                fontSize: 20,
              )),
          const SizedBox(height: 10),
         GridView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 1.7,
              crossAxisSpacing: 0,
              mainAxisSpacing: 5,
            ),

            children: const [
            Column(children: [
                Icon(
                  Icons.business,
                  size: 30,
                ),
                Text("Today Visit",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                Text("23334",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              ])
            ],
            // children: [
            //     dashy(Icons.business, "Today Visit", data.todayVisit.count.toString()),
            //     dashy(Icons.money_outlined, "Total Sales", data.totalSales.toString()),
            //     dashy(Icons.menu_book, "Total Products", data.totalProducts.toString()),
            //     dashy(Icons.people, "Total Users", data.totalUsers.toString()),
            //     dashy(Icons.message_rounded, "New Orders", data.newOrders.count.toString()),
            //     dashy(Icons.people_alt_outlined, "New Users", data.newUsers.count.toString()),
            // ],
          ),
          const SizedBox(height: 10),
          const Text("Revenue",
              style: TextStyle(
                fontSize: 20,
              )),
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
        
          const SizedBox(height: 10),
          InkWell(
            onTap: (){

              Get.to(const PublishPage());
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 10, ),
                    Text("Publish book",
                        style: TextStyle(
                          fontSize: 30,color: Color.fromARGB(255, 35, 126, 183),
                        )),
                        SizedBox(width: 100, ),
                        Card(
                          color: Color.fromARGB(255, 205, 205, 205),
                          child: IconButton(onPressed: (){
                            Get.to(const PublishPage());
                          }, 
                          icon: Icon(Icons.upload_file,size: 30,color: Colors.black,)),
                        ),                      //  Container( 
                     
                  ],
                ),
              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
               
              
                ElevatedButton(
                  onPressed: () => Get.to(const LoginPage()),
                  child: const Text("Login",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
               
                 const SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () => Get.to(const PubstatsPage()),
                  child: const Text("Stats",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}
