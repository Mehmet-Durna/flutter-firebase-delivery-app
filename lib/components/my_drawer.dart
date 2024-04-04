import 'package:delivery/pages/settings_page.dart';
import 'package:delivery/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // log out user
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),


          // home list tile
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          

           // settings list tile
                  MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.home,
            onTap: ()   {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
                 );
            },
          ),

          const Spacer(),

            // logout list tile

                           MyDrawerTile(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap:logout,
          ),

          const SizedBox(height: 25),
         
        ],
      ),
    );
  }
}