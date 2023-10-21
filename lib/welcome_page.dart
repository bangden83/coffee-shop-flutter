import 'package:flutter/material.dart';

class HalUtama extends StatefulWidget {
  const HalUtama({super.key});

  @override
  State<HalUtama> createState() => _HalUtamaState();
}

class _HalUtamaState extends State<HalUtama> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Depan(),
    const MyFavorit(),
    const MyProfil(),
  ];

  void _onTapMenu(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: const Color.fromARGB(137, 227, 221, 221),
        currentIndex: _currentIndex,
        onTap: _onTapMenu,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// awal dari kelas depan
class Depan extends StatefulWidget {
  const Depan({super.key});

  @override
  State<Depan> createState() => _DepanState();
}

class _DepanState extends State<Depan> {
  int activeButton = -1;
  List<Color> warnaTombol = List.generate(5, (index) => Colors.white);
  List<Color> warnaText = List.generate(5, (index) => Colors.black);

  List<String> textButton = [
    'Kopi Hitam',
    'Kopi Susu',
    'Kopi Karamel',
    'Kopi Coklat',
    'Kopi Tubruk',
  ];

  void _gantiWarnaTombol(int index) {
    setState(() {
      if (activeButton != -1) {
        warnaTombol[activeButton] = Colors.white;
        warnaText[activeButton] = Colors.black;
      }
      warnaTombol[index] = Colors.orange;
      warnaText[index] = Colors.white;
      activeButton = index;
    });
  }

  final List<String> imagePaths = [
    'assets/kopi-bodas.jpg',
    'assets/kopi-coklat.jpg',
    'assets/kopi-es.jpg',
    'assets/kopi-karamel.jpeg',
    'assets/kopi-liong.jpg',
    'assets/kopi-tubruk.jpg',
  ];

  final List<String> namaProduk = [
    'Kopi Bodas',
    'Kopi Coklat',
    'Kopi Es',
    'Kopi Karamel',
    'Kopi Liong',
    'Kopi Tubruk',
  ];

  final List<String> descProduk = [
    'Kopi campur susu murni',
    'Kopi dengan coklat asli',
    'Kopi dengan es batu',
    'Kopi plus karamel',
    'Kopi asli bikin melek',
    'Kopi warisan abah',
  ];

  final List<String> hargaProduk = [
    'Rp. 15.000',
    'Rp. 20.000',
    'Rp. 15.000',
    'Rp. 18.000',
    'Rp. 6.500',
    'Rp. 8.000',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 98,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.orange],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dendi Nasrulloh',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Kota Sukabumi, Jawa Barat',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/dendi.jpg'),
                            radius: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // INI BAGIAN SEARCH
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 0, left: 25, right: 25),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: const Icon(
                        Icons.filter_alt_rounded,
                        color: Colors.orange,
                      ),
                      hintText: 'Cari kopi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // INI BATAS DATA PROFIL

          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: textButton.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(warnaTombol[index]),
                      ),
                      onPressed: () {
                        _gantiWarnaTombol(index);
                      },
                      child: Text(
                        textButton[index],
                        style: TextStyle(color: warnaText[index]),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/detail');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              imagePaths[index],
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            namaProduk[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            descProduk[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            hargaProduk[index],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add_box_rounded,
                                            ),
                                            iconSize: 25,
                                            color: Colors.orange,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
// end of kelas Depan

// Kelas Favorit
class MyFavorit extends StatefulWidget {
  const MyFavorit({super.key});

  @override
  State<MyFavorit> createState() => _MyFavoritState();
}

class _MyFavoritState extends State<MyFavorit> {
  final List<String> imagePaths = [
    'assets/kopi-bodas.jpg',
    'assets/kopi-es.jpg',
    'assets/kopi-liong.jpg',
  ];

  final List<String> namaProduk = [
    'Kopi Bodas',
    'Kopi Es',
    'Kopi Liong',
  ];

  final List<String> descProduk = [
    'Kopi campur susu murni',
    'Kopi dengan es batu',
    'Kopi asli bikin melek',
  ];

  final List<String> hargaProduk = [
    'Rp. 15.000',
    'Rp. 15.000',
    'Rp. 6.500',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.of(context).pushNamed('/welcome');
                            },
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Kopi favorit kamu',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/detail');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              imagePaths[index],
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            namaProduk[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            descProduk[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            hargaProduk[index],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add_box_rounded,
                                            ),
                                            iconSize: 25,
                                            color: Colors.orange,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
// end of kelas favorit

// Ini kelas profil
class MyProfil extends StatelessWidget {
  const MyProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/dendi.jpg',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Dendi Nasrulloh'),
          const SizedBox(
            height: 8,
          ),
          const Text('TI 21 B'),
          const SizedBox(
            height: 8,
          ),
          const Text('NIM : 20210040028'),
        ],
      ),
    );
  }
}
// end of kelas profil
