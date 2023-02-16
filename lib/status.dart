import 'package:flutter/material.dart';
import 'drawer.dart';
import 'home.dart';
import 'status_model.dart';

class status extends StatefulWidget {
  const status({Key? key}) : super(key: key);

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
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
        // appBar: AppBar(
        //   title: Text("Status"),
        //   backgroundColor: Color.fromARGB(255, 16, 29, 37),
        //   actions: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Icon(Icons.search),
        //     )
        //   ],
        // ),
        drawer: DrawerScreen(),
        body: statuspage(),
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

class statuspage extends StatefulWidget {
  const statuspage({Key? key}) : super(key: key);

  @override
  State<statuspage> createState() => _statuspageState();
}

class _statuspageState extends State<statuspage> {
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
            // trailing: Text(items[i].time),
          );
        },
        separatorBuilder: (ctx, i) {
          return Divider();
        },
        itemCount: items.length);
  }
}
