import 'package:flutter/material.dart';
import 'package:riifruit/widgets/left_drawer.dart';// Impor drawer yang sudah dibuat sebelumnya

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    //variabel-variabel yang sama kayak model django
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    int _stok = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Form Tambah Item',
                ),
              ),
              backgroundColor: Color.fromARGB(255, 84, 59, 8),
              foregroundColor: Colors.white,
            ),
           
            drawer: const LeftDrawer(), // Tambahkan drawer yang sudah dibuat di sini

            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          // Input nama produk
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Nama Produk",
                                labelText: "Nama Produk",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _name = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Nama tidak boleh kosong!";
                                }
                                return null;
                              },
                            ),
                          ),

                          //Input Harga
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Harga",
                                labelText: "Harga",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _price = int.parse(value!);
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Harga tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                  return "Harga harus berupa angka!";
                                }
                                return null;
                              },
                            ),
                          ),

                          // Input Stok
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Stok",
                                labelText: "Stok",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _stok = int.parse(value!);
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Stok tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                  return "Stok harus berupa angka!";
                                }
                                return null;
                              },
                            ),
                          ),

                          //Input Deskripsi Produk
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Deskripsi",
                                labelText: "Deskripsi",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _description = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Deskripsi tidak boleh kosong!";
                                }
                                return null;
                              },
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.indigo),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    //Untuk memunculkan data ke popup
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Produk berhasil tersimpan'),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              //apa aja yang akan di munculkan di popup
                                              children: [
                                                Text('Nama Produk: $_name'),
                                                Text('Stok: $_stok'),
                                                Text('Harga: $_price'),
                                                Text('Deskripsi: $_description'),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: const Text('OK'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  _formKey.currentState!.reset();
                                  }
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          
                      ]
                )
              ),
            ),
          );
    }
}