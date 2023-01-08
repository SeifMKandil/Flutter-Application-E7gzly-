import 'package:flutter/material.dart';

class NavBarr extends StatelessWidget {
  const NavBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset("images/logo.png"),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text('My profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notifications'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
