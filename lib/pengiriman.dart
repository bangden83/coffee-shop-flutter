import 'package:flutter/material.dart';

class MyKurir extends StatelessWidget {
  const MyKurir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/kirim_barang.gif',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Horee ... kopi anda sedang diperjalanan'),
          ],
        ),
      ),
    );
  }
}
