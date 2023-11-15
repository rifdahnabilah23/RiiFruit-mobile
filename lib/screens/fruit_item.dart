import 'package:flutter/material.dart';
import 'package:riifruit/widgets/left_drawer.dart';
import 'package:riifruit/models/fruit_models.dart';

class ProductListPage extends StatefulWidget {
  final List<Product> productList;

  const ProductListPage({Key? key, required this.productList})
      : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buah'),
        backgroundColor: Color.fromARGB(255, 68, 44, 7),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: widget.productList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(widget.productList[index].name),
              subtitle: Text('Jumlah: ${widget.productList[index].amount} '),
              onTap: () {
                // Menampilkan popup dengan informasi barang yang di-klik
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(widget.productList[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Jumlah: ${widget.productList[index].amount}'),
                          Text('Harga: Rp${widget.productList[index].price}'),
                          Text('Deskripsi: ${widget.productList[index].description}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}