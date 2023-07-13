import '../../../config/routing/route_manager.dart';
import 'package:flutter/material.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      RouterManager.generateRoute(RouterManager.homeScreenRoute),
      RouterManager.generateRoute(RouterManager.userCartScreenRoute),
      RouterManager.generateRoute(RouterManager.userProfileScreenRoute)
    ];
    ValueNotifier index = ValueNotifier(2);
    return Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, value, child) {
            return BottomNavigationBar(
                currentIndex: index.value,
                onTap: (value) {
                  index.value = value;
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                ]);
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, value, child) {
            return pages[index.value];
          },
        ));
  }
}
