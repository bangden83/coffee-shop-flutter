import 'package:flutter/material.dart';
import 'package:flutter_latihan_route/detail_page.dart';
import 'package:flutter_latihan_route/home_page.dart';
import 'package:flutter_latihan_route/order_page.dart';
import 'package:flutter_latihan_route/welcome_page.dart';
import 'package:flutter_latihan_route/pengiriman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Route',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        '/welcome': (context) => const HalUtama(),
        '/detail': (context) => const DetailProduk(),
        '/order': (context) => const MyOrderPage(),
        '/kurir': (context) => const MyKurir(),
      },
    );
  }
}
