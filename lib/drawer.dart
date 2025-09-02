import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          //DrawerHeader(child: ),

          const ListTile(
            leading: Icon(Icons.note),
          ),
          const ListTile(
            leading: Icon(Icons.calendar_today_rounded),
          ),
          const ListTile(
            leading: Icon(Icons.alarm),
          ),
          const ListTile(
            leading: Icon(Icons.archive_outlined),
          ),
          Divider(
            thickness: 2,
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
          ),
          const ListTile(
            leading: Icon(Icons.star_border),
          ),
          const ListTile(
            leading: Icon(Icons.category_outlined),
          ),
          const ListTile(
            //
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
