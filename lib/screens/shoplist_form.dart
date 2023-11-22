import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:riifruit/screens/menu.dart';
import 'package:riifruit/widgets/left_drawer.dart';// Impor drawer yang sudah dibuat sebelumnya
import 'package:riifruit/models/fruit_models.dart';
import 'package:riifruit/screens/fruit_item.dart';

List<Product> productList = [];

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
    int _amount= 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
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
                                hintText: "Nama Item",
                                labelText: "Nama Item",
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
                                  _amount= int.parse(value!);
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
                                onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                        // Kirim ke Django dan tunggu respons
                                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                        final response = await request.postJson(
                                        // "https://rifdah-nabilah-tugas.pbp.cs.ui.ac.id/create-flutter/",
                                        "http://localhost:8000/create-flutter/",
                                        jsonEncode(<String, String>{
                                            'name': _name,
                                            'price': _price.toString(),
                                            'description': _description,
                                            // TODO: Sesuaikan field data sesuai dengan aplikasimu
                                            'amount':_amount.toString(),
                                        }));
                                        if (response['status'] == 'success') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                            content: Text("Produk baru berhasil disimpan!"),
                                            ));
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyHomePage()),
                                            );
                                        } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                content:
                                                    Text("Terdapat kesalahan, silakan coba lagi."),
                                            ));
                                        }
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