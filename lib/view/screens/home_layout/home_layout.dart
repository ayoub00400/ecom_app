import 'package:flutter/material.dart';

import '../../../config/routing/route_manager.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      RouterManager.generateRoute(RouterManager.homeScreenRoute),
      RouterManager.generateRoute(RouterManager.userCartScreenRoute),
      RouterManager.generateRoute(RouterManager.userProfileScreenRoute)
    ];
    ValueNotifier index = ValueNotifier(0);
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: index,
        builder: (context, value, child) {
          return BottomNavigationBar(
            elevation: 100,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: index.value,
            onTap: (value) {
              index.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            ],
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: index,
        builder: (context, value, child) {
          return IndexedStack(index: index.value, children: pages);
        },
      ),
    );
  }
}
