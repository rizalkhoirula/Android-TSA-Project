import 'package:flutter/material.dart';
import 'package:semangat/chats.dart';
import 'package:semangat/transaksi.dart';
import 'main.dart';
import 'home.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RegisterPage(),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()));
              },
            ),
          ),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: ExactAssetImage('/images/parfum.png'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5),
            child: const Text(
              "BODY MIST PARFUM 100ML - INSPIRED PARFUME BODYMIST",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   padding: EdgeInsets.only(top: 10),
          //   child: const Text(
          //     "Silahkan isi form pendaftaran dibawah ini dengan benar dan tepat",
          //     style: TextStyle(
          //       fontWeight: FontWeight.w500,
          //       fontSize: 15,
          //     ),
          //   ),
          // ),
          // Padding(padding: EdgeInsets.only(top: 30)),
          // Row(
          //   children: <Widget>[
          //     const Text(
          //       "Create your ",
          //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          //     ),
          //     const Text(
          //       "account",
          //       style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
          //     ),
          //   ],
          // ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5),
            child: const Text(
              "Rp13.900 - Rp14.990",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: const Text(
              "Spesifikasi Produk",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Jenis Kelamin : Unisex",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Volume : 100ml",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Kandungan Parfum : Eau de Toilette",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Formulasi : Spray",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Masa Penyimpanan : 36 Bulan",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Stok : 3090",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: const Text(
              "Dikirim dari : Jember",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(top: 10),
          //   child: TextField(
          //     controller: nameController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'Enter fullname',
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: 10),
          //   child: TextField(
          //     controller: nameController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'Enter username',
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: 10),
          //   child: TextField(
          //     controller: passwordController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'Enter password',
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: 5),
          // ),
          // CheckboxListTile(
          //   title: Text(
          //     'Jika anda membeli barang ini, anda harus terima apapun resikonya',
          //     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          //   ),
          //   value: checked,
          //   activeColor: Color.fromARGB(255, 16, 29, 37),
          //   onChanged: (value) {
          //     print(value);
          //     setState(() {
          //       checked = true;
          //     });
          //   },
          // ),
          Container(
            height: 85,
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              child: const Text(
                "Beli Sekarang",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => transaksi()));
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 16, 29, 37)),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Text(
              //   "Ingin masukkan ke dalam keranjang?",
              //   style: TextStyle(fontSize: 14),
              // ),
              TextButton(
                child: const Text(
                  "Masukkan Ke Keranjang",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 16, 29, 37)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
