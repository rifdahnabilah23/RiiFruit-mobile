import 'package:flutter/material.dart';
import 'package:riifruit/widgets/left_drawer.dart';
import 'package:riifruit/widgets/shop_card.dart'; //import drawer widget


class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Color.fromARGB(255, 149, 110, 63)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Color.fromARGB(255, 184, 171, 141)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 219, 144, 39)),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RiiFruit',
          style: TextStyle(
            color: Colors.white, // Mengatur warna teks menjadi putih
          ),
        ),

        backgroundColor: Color.fromARGB(255, 78, 52, 16), //mengatur background header
        foregroundColor: Color.fromARGB(255, 255, 255, 255), //mengatur warna ikon navbar

      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Toko Buah-Buahan', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    }
}
