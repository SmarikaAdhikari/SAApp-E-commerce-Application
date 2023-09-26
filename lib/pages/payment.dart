import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            EsewaPayButton(
              title: 'Pay with Esewa',
              paymentConfig: ESewaConfig.dev(
                su: 'https://esewa.com.np/merchant/invoice',
                amt: 10,
                pdc: 18,
                
                tAmt: 28,
                fu: 'https://esewa.com.np/merchant/invoice',
                pid: '1217',  //order id
              ),
              width: 40,
              onFailure: (result) async {},
              onSuccess: (result) async {},
            ),
          ],
        ),
      ), 
    );
  }
}