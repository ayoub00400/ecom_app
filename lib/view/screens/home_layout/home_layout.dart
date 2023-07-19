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
    final PageStorageBucket bucket = PageStorageBucket();
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
            currentIndex: index.value,
            onTap: (value) {
              index.value = value;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          );
        },
      ),
      body: PageStorage(
        bucket: bucket,
        child: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, value, child) {
            return pages[index.value];
          },
        ),
      ),
    );
  }
}
