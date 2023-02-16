import 'package:flutter/material.dart';
import 'drawer.dart';
import 'chartModel.dart';
import 'home.dart';
import 'setting.dart';
import 'main.dart';


class calls extends StatefulWidget {
  const calls({Key? key}) : super(key: key);

  @override
  State<calls> createState() => _callsState();
}

enum MenuItem {
  item1,
  item2,
}

class _callsState extends State<calls> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Chats',
      style: optionStyle,
    ),
    Text(
      'Index 1: Status',
      style: optionStyle,
    ),
    Text(
      'Index 2: Calls',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> gambar = [
    "bjorka.png",
    "bjorka.png",
    "bjorka.png",
    "bjorka.png",
  ];

  static const Map<String, Color> colors = {
    '1': Color(0xFF2DB569),
    '2': Color(0xFFF38688),
    '3': Color(0xFF45CAF5),
    '4': Color(0xFFB19ECB),
    '5': Color(0xFFF58E4C),
    '6': Color(0xFF46C1BE),
    '7': Color(0xFFFFEA0E),
    '8': Color(0xFFDBE4E9),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calls"),
          backgroundColor: Color.fromARGB(255, 16, 29, 37),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (value) {
                  if (value == MenuItem.item1) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Setting(),
                    ));
                  } else if (value == MenuItem.item2) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const login(),
                    ));
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: MenuItem.item1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Color.fromARGB(255, 16, 29, 37),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Setting'),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: MenuItem.item2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Color.fromARGB(255, 16, 29, 37),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      ),

                      // PopupMenuItem(
                      //   value: MenuItem.item1,
                      //   child: Text('Setting'),
                      // ),
                      // PopupMenuItem(
                      //   value: MenuItem.item2,
                      //   child: Text('Logout'),
                      // ),
                    ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        drawer: DrawerScreen(),
        body: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [Colors.white, Colors.black])),
          child: new PageView.builder(
              controller: new PageController(viewportFraction: 0.8),
              itemCount: gambar.length,
              itemBuilder: (BuildContext context, int i) {
                return new Padding(
                  padding:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
                  child: new Material(
                    elevation: 8.0,
                    child: new Stack(fit: StackFit.expand, children: <Widget>[
                      new Hero(
                        tag: gambar[i],
                        child: new Material(
                          child: new InkWell(
                            child: new Flexible(
                              flex: 1,
                              child: Container(
                                color: colors.values.elementAt(i),
                                child: new Image.asset(
                                  "assets/images/${gambar[i]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new halamanDua(
                                          gambar: gambar[i],
                                          colors: colors.values.elementAt(i),
                                        ))),
                          ),
                        ),
                      )
                    ]),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.create,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 16, 29, 37),
          onPressed: () {},
        ),
      ),
    );
  }
}

class halamanDua extends StatefulWidget {
  halamanDua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  State<halamanDua> createState() => _halamanDuaState();
}

class _halamanDuaState extends State<halamanDua> {
  Color warna = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              gradient: new RadialGradient(
                  center: Alignment.center,
                  colors: [Colors.black, Colors.white, Colors.black])),
        ),
        new Center(
          child: new Hero(
              tag: widget.gambar,
              child: new ClipOval(
                child: new SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: new Material(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: new Flexible(
                          flex: 1,
                          child: Container(
                            color: widget.colors,
                            child: new Image.asset(
                              "assets/images/${widget.gambar}",
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
