import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  NumberFormat formatRibuan = NumberFormat.decimalPattern('id-ID');
  int jumOrder = 1;
  int hargaProduk = 6500;
  int totalBayar = 6500;

  void _totalHarga(int jumOrder, int hargaProduk) {
    setState(() {
      totalBayar = jumOrder * hargaProduk + 1000;
    });
  }

  void _tambahOrder() {
    setState(() {
      jumOrder++;
    });
  }

  void _kurangiOrder() {
    setState(() {
      if (jumOrder > 1) jumOrder--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Center(
          child: Text('Order'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // INI BAGIAN TOMBOL DELIVER DAN PICK UP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Colors.orange,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(150, 30))),
                      onPressed: () {},
                      child: const Text(
                        'Deliver',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        fixedSize: const MaterialStatePropertyAll(
                          Size(150, 30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Pick Up',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            // INI BAGIAN ALAMAT PENGIRIMAN
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Alamat Pengiriman',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Jl. Cisaat',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Jl. Cisaat No. 18 Rt. 005 Rw. 007 Tipar Samping Universitas Nusaputra, Sukabumi Jawa Barat',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.edit_document,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    child: Text(
                      'Ubah Alamat',
                      style: TextStyle(
                        color: Color.fromARGB(255, 57, 56, 56),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.add_comment,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    child: Text(
                      'Tambah Catatan',
                      style: TextStyle(
                        color: Color.fromARGB(255, 57, 56, 56),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // INI BAGIAN NAMA PRODUK DAN TOMBOL JUMLAH ITEM
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/kopi-liong.jpg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kopi Liong Bulan',
                        style: TextStyle(
                          color: Color.fromARGB(255, 60, 57, 57),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Kopi hitam tanpa gula',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              size: 14,
                            ),
                            onPressed: () {
                              _kurangiOrder();
                              _totalHarga(jumOrder, hargaProduk);
                            },
                          ),
                          Text(jumOrder.toString()),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 14,
                            ),
                            onPressed: () {
                              _tambahOrder();
                              _totalHarga(jumOrder, hargaProduk);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // INI BAGIAN INFO DISKON
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 50),
              child: Row(
                children: [
                  const Icon(
                    Icons.discount_sharp,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text('1 Kupon diskon digunakan'),
                  const SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_next,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // INI BAGIAN INFO PAYMENT
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rp. 6.500',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ongkos Kirim',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Rp. 2.000',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'Rp. 1.000',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            // INI BAGIAN TOTAL PAYMENT
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rp. ${formatRibuan.format(totalBayar)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            // INI BAGIAN TOTAL UANG YANG DIBAYARKAN DAN METODE BAYAR
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.money_rounded,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Cash',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Rp. ${formatRibuan.format(totalBayar)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // INI BUTTON UNTUK ORDER
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        fixedSize:
                            const MaterialStatePropertyAll(Size(350, 50)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.orange),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/kurir');
                      },
                      child: const Text(
                        'Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
