import 'package:flutter/material.dart';
import 'drawer.dart';
import 'chartModel.dart';
import 'calls.dart';
import 'status.dart';
import 'main.dart';


class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

enum MenuItem {
  item1,
  item2,
  item3,
  item4,
}

class _chatsState extends State<chats> {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chats"),
          backgroundColor: Color.fromARGB(255, 16, 29, 37),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (value) {
                  if (value == MenuItem.item1) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const chats(),
                    ));
                  } else if (value == MenuItem.item2) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const status(),
                    ));
                  } else if (value == MenuItem.item3) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const calls(),
                    ));
                  } else if (value == MenuItem.item4) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const login(),
                    ));
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: MenuItem.item1,
                        child: Text('Chats'),
                      ),
                      PopupMenuItem(
                        value: MenuItem.item2,
                        child: Text('Status'),
                      ),
                      PopupMenuItem(
                        value: MenuItem.item3,
                        child: Text('Calls'),
                      ),
                      PopupMenuItem(
                        value: MenuItem.item4,
                        child: Text('Logout'),
                      ),
                    ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        drawer: DrawerScreen(),
        body: homePage(),
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
