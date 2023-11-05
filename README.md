------------ TUGAS 7 ---------------

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Jawaban:
Stateless Widget tidak memiliki state internal, sehingga mereka tidak memiliki kemampuan untuk menyimpan data yang mengalami perubahan seiring waktu. Setelah dirender untuk pertama kalinya, mereka bersifat "immutable" dan tidak dapat dimodifikasi. Stateless Widget sering digunakan untuk komponen yang tidak memerlukan perubahan state seiring waktu, seperti tampilan statis atau elemen UI yang tetap konsisten.

Sebaliknya, Stateful Widget memiliki state internal yang dapat mengalami perubahan seiring berjalannya waktu. Mereka memiliki objek State terkait yang berfungsi untuk menyimpan dan memperbarui data. Ketika terjadi perubahan data dalam widget, Stateful Widget memiliki kemampuan untuk melakukan pembaruan diri agar mencerminkan perubahan tersebut. Stateful Widget digunakan untuk mengelola komponen yang memerlukan pembaruan, interaksi, dan perubahan keadaan, seperti formulir, daftar yang dapat digulir, atau tampilan yang perlu disesuaikan dengan input pengguna.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Jawaban:
- MaterialApp: Sebagai akar dari aplikasi Flutter yang dibangun dengan menggunakan desain Material Design dari Google, MaterialApp berfungsi sebagai titik awal yang menawarkan berbagai pengaturan dan konfigurasi yang dapat disesuaikan untuk aplikasi, termasuk tema, rute, serta berbagai opsi lainnya.
- Material: Untuk memberi warna pada latar belakang kartu.
- MyHomePage: Widget halaman utama aplikasi.
- Text: Untuk menampilkan teks.
- Column: Untuk mengatur widget dalam kolom vertikal.
- AppBar: Untuk menampilkan bilah atas di aplikasi.
- Scaffold: Untuk membuat tata letak dasar aplikasi.
- GridView: Untuk menampilkan elemen dalam tata letak grid.
- GridView.count: Untuk membuat grid layout dengan jumlah kolom yang didefinisikan.
- SingleChildScrollView: Untuk membuat area scrollable vertikal yang hanya memiliki satu widget anak.
- Padding: Untuk menambah jarak di sekitar widget anaknya.
- Container: Untuk mengatur tata letak dan estetika widget anak di dalamnya, dapat menyesuaikan properti seperti warna latar belakang, padding, margin, dan sebagainya dengan bantuan widget Container. Ini adalah salah satu elemen widget yang sering digunakan untuk mengatur tampilan dalam antarmuka pengguna.
- InkWell: Untuk memberi efek respons ketika kartu diklik. Biasanya digunakan di sekitar widget lain, seperti Text, Image, atau Container.
- Center: Center adalah widget yang digunakan untuk mengatur widget anaknya agar berada di tengah dari tata letak (layout) orang tua, baik secara horizontal maupun vertikal. Ini adalah widget yang sangat berguna untuk mengatur tampilan elemen di tengah layar atau di tengah area yang lebih besar.
- Icon: Untuk menampilkan simbol dalam antarmuka pengguna Anda.
- SnackBar: Untuk menampilkan pesan sementara ketika kartu diklik.
- ItemCard: Untuk menampilkan setiap elemen dalam grid sebagai kartu.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
Jawaban:
- Install flutter terlebih dahulu

- Buat project baru bernama RiiFruit dengan cara menjalankan:
    flutter create riifruit
    cd riifruit

- Jalankan program dengan perintah:
    flutter run

- Buat file baru bernama menu.dart pada direktori riifruit/lib, kemudian import

    import 'package:flutter/material.dart';

  lalu pindahkan (cut) kode baris ke-39 hingga akhir yang berisi class MyHomePage dan _MyHomePageState dari main.dart ke dalam menu.dart, kemudian import ini ke dalam main.dart

    import 'package:riifruit/menu.dart';

- Pada file main.dart, hapus MyHomePage(title: 'Flutter Demo Home Page') sehingga menjadi MyHomePage()

- Pada file menu.dart, sifat widget halaman akan diubah dari stateful menjadi stateless. Ubah pada bagian ({super.key, required this.title}) menjadi ({Key? key}) : super(key: key);.

- Hapus final String title; sampai bawah serta tambahkan Widget build.

- Selanjutnya menambahkan teks dan card untuk memperlihatkan barang yang dijual. define tipe pada list.

    class ShopItem {

    final String name;

    final IconData icon;

    ShopItem(this.name, this.icon);

    }

- Tambahkan kode ini di bawah kode MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [

    ShopItem("Lihat Produk", Icons.checklist),

    ShopItem("Tambah Produk", Icons.add_shopping_cart),

    ShopItem("Logout", Icons.logout),

    ];

- Tambahkan kode didalam Widget build.

    return Scaffold(

      appBar: AppBar(

        title: const Text(

          'Shopping List',

        ),

      ),

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

                  'PBP Shop', // Text yang menandakan toko

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 30,

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

- Kemudian buat widget stateless baru untuk menampilkan card.

    class ShopCard extends StatelessWidget {

        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override

        Widget build(BuildContext context) {

            return Material(

            color: Colors.indigo,

            child: InkWell(

                // Area responsive terhadap sentuhan

                onTap: () {

                // Memunculkan SnackBar ketika diklik

                ScaffoldMessenger.of(context)

                    ..hideCurrentSnackBar()

                    ..showSnackBar(SnackBar(

                        content: Text("Kamu telah menekan tombol ${item.name}!")));

                },
                child: Container(

                // Container untuk menyimpan Icon dan Text

                padding: const EdgeInsets.all(8),

                child: Center(

                    child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                        Icon(

                        item.icon,

                        color: Colors.white,

                        size: 30.0,

                        ),

                        const Padding(padding: EdgeInsets.all(3)),

                        Text(

                        item.name,

                        textAlign: TextAlign.center,

                        style: const TextStyle(color: Colors.white),

                        ),
                        
                    ],
                    ),
                ),
                ),
            ),
            );
        }
    }



