import 'package:badges/badges.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../features/alchemy/ui/alchemy_page.dart';
import '../../../features/ceremony/ui/ceremony_page.dart';
import '../../../features/element/ui/element_page.dart';
import '../../../features/merchant/ui/merchant_page.dart';
import '../../../features/sanctuary/ui/sanctuary_page.dart';
import '../../auth/service/auth_service.dart';
import '../../routes/router_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

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
            SanctuaryPage(),
            ElementPage(),
            AlchemyPage(),
            CeremonyPage(),
            MerchantPage(),
          ],
        ),
      ),
      floatingActionButton: buildFAB(),
      bottomNavigationBar: buildBottomNavyBar(),
    );
  }

  BottomNavyBar buildBottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
            title: const Text('Sanctuary'),
            icon: Badge(
              showBadge: 10 > 0 ? true : false,
              badgeContent: const Text(
                '!',
                style: TextStyle(color: Colors.white70),
              ),
              badgeColor: Colors.deepOrange,
              position: BadgePosition.topStart(),
              child: const Icon(Icons.temple_buddhist_outlined),
            )),
        BottomNavyBarItem(
            title: const Text('Elements'), icon: const Icon(Icons.apps)),
        BottomNavyBarItem(
            title: const Text('Alchemy'),
            icon: const Icon(Icons.soup_kitchen_outlined)),
        BottomNavyBarItem(
            title: const Text('Ceremony'),
            icon: const Icon(Icons.celebration_outlined)),
        BottomNavyBarItem(
            title: const Text('Merchant'),
            icon: const Icon(Icons.shop_outlined)),
      ],
    );
  }
}

class buildFAB extends StatelessWidget {
  const buildFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      child: Icon(Icons.add_alert_outlined),
      onPressed: () {},
    );
  }
}
