import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            color: const Color(0xFF05141F),
            toggleColor: Colors.white,
            items: [
              SidebarItem(
                icon: Icons.home_outlined,
                title: 'Home',
                unselectedColor: Colors.white,
                childrenBackground: Colors.white12,
                children: [
                  SidebarItem(
                    title: 'Hello',
                    icon: Icons.abc,
                    onTap: () {},
                    unselectedColor: Colors.white,
                  ),
                  SidebarItem(
                    title: 'Hello',
                    icon: Icons.abc,
                    onTap: () {},
                    unselectedColor: Colors.white,
                  ),
                ],
              ),
              const SidebarItem(
                  icon: Icons.person_outlined,
                  title: 'User',
                  unselectedColor: Colors.white,
                  childrenBackground: Colors.white12,
                  children: [
                    SidebarItem(
                      title: 'Change password',
                      icon: Icons.lock,
                      unselectedColor: Colors.white,
                    ),
                  ]),
              const SidebarItem(
                icon: Icons.settings_outlined,
                title: 'Settings',
                unselectedColor: Colors.white,
                childrenBackground: Colors.white12,
                children: [
                  SidebarItem(
                    title: 'Data',
                    icon: Icons.check,
                    unselectedColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
