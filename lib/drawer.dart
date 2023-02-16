import 'package:flutter/material.dart';
import 'package:semangat/calls.dart';
import 'package:semangat/chats.dart';
import 'package:semangat/gelocation2.dart';
import 'package:semangat/geolocator.dart';
import 'package:semangat/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'calls.dart';
import 'product.dart';
import 'geolocator.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isLoggedIn = true;
  String name = '';

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '');

    setState(() {
      name = '';
      isLoggedIn = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Ilham Ibnu Ahmad"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/bjorka.png")),
              accountEmail: Text("bjorka@ai.com"),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 29, 37),
              )),
          DrawerListTile(
            icondata: Icons.contacts,
            title: "Contacts",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const home()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.shopping_bag,
            title: "Produk",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const product()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.bookmark_border,
            title: "Saved message",
            onTilePressed: () {},
          ),
          DrawerListTile(
            icondata: Icons.phone,
            title: "Calls",
            onTilePressed: () {},
          ),
          DrawerListTile(
            icondata: Icons.logout,
            title: "Minggu Ke 6",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const calls()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.location_searching,
            title: "Cari Kordinat",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const geolocation2()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.location_searching,
            title: "Cari Alamat",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const geolator()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.logout,
            title: "Log Out",
            onTilePressed: () {
              Navigator.pop(context);
              logout();
            },
          ),
          Divider(),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text("    Labels",
              style: TextStyle(
                color: Colors.grey,
              )),
          Padding(padding: EdgeInsets.only(top: 10)),
          DrawerListTile(
            icondata: Icons.label,
            title: "Family",
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }

  getdataSharedPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString("Username").toString();
    print("data dari sharedpref $data");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("data dari sharedpref $data")));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icondata;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {Key? key,
      required this.icondata,
      required this.title,
      required this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(icondata),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
