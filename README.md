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



------ TUGAS 8 ------

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Jawaban:

Navigator.push()

- Menampilkan halaman baru dengan cara menambahkannya ke paling atas stack. Pengguna dapat kembali ke halaman sebelumnya. Contoh penggunaan:
Navigator.push(context, MaterialPageRoute(builder: (context) => PageName()))

Navigator.pushReplacement()

- Menampilkan halaman baru dengan cara menggantikan halaman yang berada di posisi paling atas stack dengan halaman baru tersebut. Akibatnya pengguna tidak dapat kebali ke halaman sebelumnya dengan mudah. Contoh penggunaan:
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageName()))

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Jawaban:

1. Row

  - Mengatur elemen secara horizontal dari kiri ke kanan
  - Penggunaan: penataan tombol dan judul pada navigasi dalam baris

2. Column

  - Mengatur elemen secara vertikal dari atas ke bawah
  - Penggunaan: menata daftar item pada formulir

3. Center

  - Meletakkan elemen di tengah
  - Penggunaan: meletakkan elemen di tengah layar

4. Container

  - Sebagai wadah untuk mengatur tata letak dan gaya elemen pada aplikasi seperti padding, margin, borders, dan color
  - Penggunaan: memberi padding, margin, border, dan color pada elemen

5. ListView

  - Membuat daftar yang dapat discroll
  - Penggunaan: daftar item yang sangat panjang

6. Stack

  - Menumpuk elemen-elemen di atas satu sama lain
  - Penggunaan: ketika ingin menumpuk gambar, icon, dan teks di satu tumpukan

7. Expanded

  - Digunakan di dalam Row atau Column untuk mengatur bagian yang mengisi sisi ruang yang tersedia
  - Penggunaan: ketika ingin membagi ruang yang tersedia secara proporsional antara beberapa elemen

8. Sizedbox

  - Menentukan ukuran lebar dan tinggi dari sebuah widget
  - Penggunaan: mengatur ruang kosong atau mengontrol ukuran elemen dalam tata letak Anda

9. Card

  - Untuk mengelilingi elemen-elemen seperti gambar, teks, atau tombol untuk membuat tampilan kartu
  - Penggunaan: sering digunakan dalam daftar item atau dalam konteks informasi yang terkandung dalam satu blok visual

10. GridView

  - Menampilkan elemen dalam tata letak berbentuk grid atau tabel. Kita dapat megnatur jumlah kolom, menggulir elemen-elemen dalam grid, dan mengontrol tampilan yang berbeda untuk setiap elemen
  - Pengunaan: ketika ingin menampilakn elemen dalam bentuk tabel

11. Wrap

  - Mengatur elemen-elemen dalam baris atau kolom yang berjajar tetapi elemen-elemen tersebut tidak muat dalam baris atau kolom tersebut, sehingga mereka melanjutkan ke baris atau kolom berikutnya
  - Penggunaan: menata elemen yang ingin dilanjutkan ke baris atau kolom berikutnya

12. Align

  - Mengatur posisi align dari child terhadap elemen parentnya.
  - Penggunaan: ketika ingin meletakkan tombol di pojok kanan bawah layar

13. AspectRatio

  - Mengatur ukuran suatu elemen berdasarkan aspect ratio tertentu
  - Penggunaan: mengatur aspect ratio dari elemen sehingga tidak berubah meskipun menggunakan device yang berbeda

14. Baseline

  - Mengatur posisi suatu elemen sehingga baseline/garis dasarnya sejajar
  - Pengunaan: ketika ingin memposisikan elemen terhadap garis dasarnya

15. Constrainedbox

  - Mengatur batasan lebar dan tinggi minimum dan maksimum untuk elemen-elemen anaknya.
  - Penggunaan: untuk mengontrol ukuran dari elemen secara detail

16. Padding

  - Menambahkan jarak (padding) di sekeliling anaknya
  - Penggunaan: mengatur ruang antara elemen-elemen dalam tata letak

17. Transform

  - Mentransformasikan atau mengubah elemen-elemen anaknya seperti menggeser, memutar, atau mengubah ukuran mereka.
  - Penggunaan: membuat efek visual atau animasi

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Jawaban:

Saya menggunakan TextFormField untuk menerima input nama item, stok, harga, dan deskripsi. Saya menggunakan ini karena cocok untuk digunakan untuk mengumpulkan input-input dalam bentuk teks

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Jawaban:

Clean Architecture adalah sebuah konsep pengembangan perangkat lunak yang bertujuan untuk memisahkan komponen-komponen dalam sebuah aplikasi menjadi lapisan-lapisan yang independen dan berinteraksi melalui batasan-batasan yang jelas. Konsep ini membantu dalam memisahkan logika bisnis dari detail-detail teknis dan infrastruktur sehingga aplikasi dapat menjadi lebih bersih, mudah diuji, dan mudah untuk dikelola.

Berikut ini lapisan-lapisan clean architecture pada aplikasi Flutter:

  1. Lapisan Presentasi (Presentation Layer)

    - Lapisan ini berisi tampilan Flutter seperti widget-widget UI, halaman, dan komponen antarmuka pengguna.

  2. Lapisan Bisnis (Business Logic Layer)

    - Lapisan yang berisi logika bisnis inti dalam aplikasi yang terpisah dari lapisan tampilan. Flutter biasa menggunakan pola desain seperti BLoC (Business Logic Component), Provider, atau Redux untuk mengelola logika bisnis.

  3. Lapisan Data (Data Layer)

    - Lapisan ini berisi implementasi konkrit dari repositori yang berkomunikasi dengan sumber data aktual seperti API REST, SQLite, Firebase, atau data lokal.

  4. Lapisan Eksternal (External Layer)

    - Lapisan ini mencakup pustaka-pustaka Flutter dan paket-paket eksternal yang digunakan dalam aplikasi.


5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Jawaban:

Menambahkan drawer menu untuk navigasi

- Buat direktori baru yaitu widgets
- Buat file baru  dengan nama left_drawer.dart di dalam widgets
- Tambahkan import untuk navigasi ke halaman MyHomePage dan ShopFormPage
- Tambahkan kode untuk Routing
- Tambahkan kode untuk Bagian drawer header
- Kemudian setelah berhasil membuat drawe menu, masukan ke halaman menu.dart

Menambahkan Form dan Input

- Buat file baru di lib dengan nama shoplist_form.dart
- Tambahkan kode di dalam file shoplist_form.dart
- Ubah widget Placeholder dengan potongan kode baru
- Buat variabel baru bernama _formKey lalu tambahkan _formKey tersebut ke dalam atribut key milik widget Form.
- Buat beberapa variabel untuk menyimpan input dari masing-masing field yang akan dibuat
- Buat widget Column sebagai child dari SingleChildScrollView
- Buat widget TextFormField yang dibungkus oleh Padding untuk "Nama Item"
- Tambahkan atribut crossAxisAlignment untuk mengatur alignment children dari Column
- Buat tiga TextFormField yang dibungkus dengan Padding sebagai child selanjutnya dari Column untuk field price, stok, dan description
- Buat tombol sebagai child selanjutnya dari Column, kemudian bungkus tombol ke dalam widget Padding dan Align

Memunculkan Data

- Tambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget AlertDialog
- Tambahkan fungsi untuk reset form

Menambahkan Fitur Navigasi pada Tombol

- Pada menu.dart tambahkan kode di dalam onTap untuk dapat melakukan navigasi ke route lain (tambahkan kode tambahan di bawah kode ScaffoldMessenger yang menampilkan snackbar).
- Tambahkan navigator.pushreplacment untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage


- Kemudian lakukan Refactoring File dengan cara membuat satu folder screens. Kemudian di dalamnya direct file menu.dart dan shoplist_form.dart.
- Buat berkas baru dengan nama shop_card.dart pada direktori widgets
- Pindahkan isi widget ShopItem pada menu.dart
- import halaman shoplist_form.dart pada berkas shop_card.dart dan import halaman shop_card.dart pada berkas menu.dart.



------------- TUGAS 9 --------------------

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Jawab:

Ya, kita mampu mengakses data JSON tanpa perlu membuat model terlebih dahulu. Proses pengambilan data JSON melibatkan pembacaan atau konsumsi data yang dikirimkan dalam format JSON. Tindakan ini dapat dilakukan menggunakan bahasa pemrograman yang mendukung manipulasi JSON atau dengan menggunakan perpustakaan khusus yang tersedia dalam berbagai bahasa pemrograman. Sebaliknya, pembuatan model seringkali terkait dengan kebutuhan analisis data yang lebih mendalam, seperti dalam konteks pembelajaran mesin, di mana Anda ingin membuat model berdasarkan data yang telah Anda peroleh.

Apakah lebih baik melakukan pengambilan data JSON tanpa membuat model terlebih dahulu atau tidak tergantung pada kebutuhan dan tujuan. Jika tujuannya hanya untuk mengakses atau menampilkan data JSON yang diterima dari suatu API atau sumber data lainnya, lebih baik tidak membuat model. Jika tujuannya untuk menganalisis data lebih lanjut, memprediksi pola, atau membuat rekomendasi berdasarkan data tersebut, perlu membangun model.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Jawab:
CookieRequest bertugas mengelola permintaan request yang terkait dengan cookie dalam suatu aplikasi. Class ini bertanggung jawab atas pengaturan aspek-aspek yang berkaitan dengan data yang disimpan di sisi klien untuk melacak informasi terkait sesi pengguna. Untuk memastikan manajemen cookie dilakukan secara seragam di semua komponen dalam aplikasi, sebuah instance dari CookieRequest perlu dibagikan ke seluruh komponen. Dengan cara ini, keberlanjutan sesi pengguna dapat dijaga dengan konsistensi.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Jawab:
- Gunakan package dan library yang diperlukan, contohnya http dan convert.
- Fetch data menggunakan HTTP untuk meminta data dari server yang memiliki data JSON tersebut.
- Parsing atau convert response tersebut ke dalam bentuk JSON.
- Menampilkan data di flutter contohnya menggunakan ListView.builder

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Jawab:
- Mulai dengan menggunakan paket pbp_django_auth, buatlah sebuah CookieRequest baru dan masukkan ke dalam variabel yang dinamai request.
- Di dalam login.dart, aplikasi akan meminta masukan teks berupa nama pengguna (username) dan kata sandi (password). Ketika formulir tersebut dikirimkan (submitted), akan melakukan pemanggilan fungsi, di mana username dan password tersebut akan dikirimkan sebagai permintaan (request) ke proyek Django untuk proses otentikasi dan login pengguna. Jika berhasil, akan menghasilkan JsonResponse yang menyatakan keberhasilan, dan sebaliknya jika gagal.

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

Jawab:
- TextField: Berfungsi sebagai input teks dari pengguna. Dalam konteks tugas ini, digunakan untuk menerima username dan password selama proses login dan registrasi.
- SizedBox: Menciptakan suatu ruang yang ditentukan. Dalam tugas ini, berperan sebagai elemen untuk memberikan jarak atau pemisah antara TextField username dan password.
- ElevatedButton: Membuat tombol dengan efek elevasi saat ditekan. Dalam tugas ini, digunakan sebagai tombol untuk mengirimkan data saat proses login dan registrasi.
- TextButton: Membuat tombol berupa teks tanpa latar belakang. Dalam konteks tugas, diterapkan pada tombol registrasi.
- ListView.builder: Membuat daftar item yang dapat di-scroll. Digunakan untuk menampilkan daftar item yang ada dalam tugas ini.
- Text: Berperan dalam pembuatan elemen teks. Pada tugas ini, dimanfaatkan untuk menampilkan detail teks ketika suatu item pada daftar item ditekan.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Jawab:

- Mengecek deployment dari tugas Django
- Membuat halaman login pada proyek tugas Flutter dengan membuat django-app authentication pada project DJango, menambahkan authentication ke INSTALLED_APPS di main project settings.py, menjalankan pip install django-cors-headers, menambahkan corsheaders ke INSTALLED_APPS, dan menambahkan corsheaders.middleware.CorsMiddleware di settings.py aplikasi
- Menambah variable pada setting.py
- Membuat fungsi di views.py authentication dan routing url di authentication dan hana_grosir
- Menginstall package untuk flutter
- Menggunakan package dengan memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider
- Membuat file login.dart di screens dan mengisinya dengan kode untuk laman login dan mengubah home: LoginPage() di main.dart
- Membuat model kustom dengan cara membuat endpoint JSON dan menyalin data JSON ke situs web Quicktype
- Mengubah setup name menjadi `Product`, source type menjadi `JSON`, dan language menjadi Dart pada situs web Quicktype
- Menerapkan Fetch Data dari Django untuk ditampilkan ke Flutter dengan cara menambahkan package http, menambahkan kode untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat di file android/app/src/main/AndroidManifest.xml
- Melakukan fetch data dari django dengan membuat file list_product.dart di folder `lib/screens`, menambahkan impor library yang dibutuhkan dan kode yang dibutuhkan
- Menambahkan halaman list_product.dart ke widgets/left_drawer.dart 
- Mengubah fungsi tombol Lihat Item agar mengarahkan ke halaman ProductPage
- Impor file yang dibutuhkan dan menambahkan ProductPage ke `left_drawer.dart `dan shop_card.dart
- Mengintegrasikan form flutter dengan layanan django dengan cara membuat views baru di views.py pada main dengan nama create_product_flutter dan menambahkan routing di urls.py
- DI flutter kita menghubungkan halaman shoplist_form.dart dengan CookieRequest dan mengubah perintah pada onPressed() button sehingga akan routing ke link django
- Mengimplementasikan fitur logout dengan menambahkan fungsi di authentication/views.py dan routing di urls.py
- Di Flutter, menambahkan kode request dan import di `lib/widgets/shop_card.dart`, mengubah perintah onTap pada widget Inkwell menjadi `onTap: () async`, dan menambahkan kode di dalam async
- Untuk dapat melihat detail per item, kita perlu membuat file baru bernama detail_page.dart yang akan mengurusi semua detail item dan pada list_product.dart, ditambahkan kode untuk membuat nama item dapat di klik dan akan masuk ke detail_page.dart untuk menampilkan detail per item