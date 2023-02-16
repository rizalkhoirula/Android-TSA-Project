import 'package:semangat/main.dart';
import 'package:semangat/setting.dart';
import 'status.dart';
import 'calls.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'chartModel.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

enum MenuItem {
  item1,
  item2,
}

class _homeState extends State<home> {
  int _selectedIndex = 0;
  final screen = [
    homePage(),
    status(),
    calls(),
  ];

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

      if (index == 0) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MeChats"),
          backgroundColor: Color.fromARGB(255, 16, 29, 37),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.search),
            ),
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
          ],
        ),
        drawer: DrawerScreen(),
        body: screen[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.create,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 16, 29, 37),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: 'Calls',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 16, 29, 37),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) {
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(items[i].profileUrl),
            ),
            title: Text(
              items[i].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(items[i].message),
            trailing: Text(items[i].time),
          );
        },
        separatorBuilder: (ctx, i) {
          return Divider();
        },
        itemCount: items.length);
  }
}
