import 'package:badges/badges.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../auth/service/auth_service.dart';
import '../../routes/router_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_PAGE.home.toTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.error_outline),
            onPressed: () {
              GoRouter.of(context).goNamed(
                APP_PAGE.error.toName,
                extra: "Error from Home",
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              authService.logOut();
            },
          ),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.indigo,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: const Text('Item One'),
              icon: Badge(
                showBadge: 10 > 0 ? true : false,
                badgeContent: Text(
                  '!',
                  style: const TextStyle(color: Colors.white70),
                ),
                badgeColor: Colors.deepOrange,
                position: BadgePosition.topStart(),
                child: const Icon(Icons.temple_buddhist_outlined),
              )),
          BottomNavyBarItem(
              title: const Text('Item Two'), icon: const Icon(Icons.apps)),
          BottomNavyBarItem(
              title: const Text('Item Three'),
              icon: const Icon(Icons.home_max_outlined)),
          BottomNavyBarItem(
              title: const Text('Item Four'),
              icon: const Icon(Icons.event_available_outlined)),
          BottomNavyBarItem(
              title: const Text('Item Five'),
              icon: const Icon(Icons.shop_outlined)),
        ],
      ),
    );
  }
}
