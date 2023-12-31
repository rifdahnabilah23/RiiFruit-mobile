import 'package:flutter/material.dart';
import 'package:riifruit/screens/fruit_item.dart';
import 'package:riifruit/screens/list_product.dart';
import 'package:riifruit/screens/menu.dart';
import 'package:riifruit/screens/shoplist_form.dart'; // Impor halaman ShopFormPage


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Bagian drawer header
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 84, 59, 25),
            ),
            child: Column(
              children: [
                Text(
                  'Shopping List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan belanjamu di sini!",
                    // Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center, // Center alignment
                    style: TextStyle(
                    fontSize: 15, // Font size 15
                    color: Colors.white, // Text color white
                    fontWeight: FontWeight.normal,
                    ),
                )
              ],
            ),
          ),

          // Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              //routing ke ShopFormPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
            },
          ),
          
          // ListTile(
          //   leading: const Icon(Icons.view_list),
          //   title: const Text('Lihat Item'),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ProductListPage(productList: productList),
          //       ));
          //   },
          // ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk'),
            onTap: () {
                // Route menu ke halaman produk
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
                );
            },
          ),

        ],
      ),
    );
  }
}