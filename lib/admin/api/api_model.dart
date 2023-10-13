class DashboardModel {
    final NewOrders todayVisit;
    final int totalSales;
    final int totalProducts;
    final int totalUsers;
    final NewOrders newOrders;
    final NewOrders newUsers;

    DashboardModel({
        required this.todayVisit,
        required this.totalSales,
        required this.totalProducts,
        required this.totalUsers,
        required this.newOrders,
        required this.newUsers,
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        todayVisit: NewOrders.fromJson(json["todayVisit"]),
        totalSales: json["totalSales"],
        totalProducts: json["totalProducts"],
        totalUsers: json["totalUsers"],
        newOrders: NewOrders.fromJson(json["newOrders"]),
        newUsers: NewOrders.fromJson(json["newUsers"]),
    );

  
}

class NewOrders {
    final int count;
    final dynamic percent;

    NewOrders({
        required this.count,
        required this.percent,
    });

    factory NewOrders.fromJson(Map<String, dynamic> json) => NewOrders(
        count: json["count"],
        percent: json["percent"],
    );


}