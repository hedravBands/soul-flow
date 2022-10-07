import 'package:badges/badges.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../module/alchemy/view/alchemy_page.dart';
import '../../../module/ceremony/view/ceremony_page.dart';
import '../../../module/element/view/element_page.dart';
import '../../../module/merchant/ui/merchant_page.dart';
import '../../../module/sanctuary/presentation/view/sanctuary_page.dart';
import '../../auth/service/auth_service.dart';
import '../../route/router_utils.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(APP_PAGE.home.toTitle),
          backgroundColor: Colors.black87,
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
        body: SafeArea(
          child: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: const [
                SanctuaryPage(),
                ElementPage(),
                AlchemyPage(),
                CeremonyPage(),
                MerchantPage(),
              ],
            ),
          ),
        ),
        floatingActionButton: const buildFAB(),
        bottomNavigationBar: buildBottomNavyBar(),
      ),
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
          title: const Text('Elements'),
          icon: const Icon(Icons.apps),
        ),
        BottomNavyBarItem(
          title: const Text('Alchemy'),
          icon: const Icon(Icons.soup_kitchen_outlined),
        ),
        BottomNavyBarItem(
          title: const Text('Ceremony'),
          icon: const Icon(Icons.celebration_outlined),
        ),
        BottomNavyBarItem(
          title: const Text('Merchant'),
          icon: const Icon(Icons.shop_outlined),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class buildFAB extends StatelessWidget {
  const buildFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      child: const Icon(Icons.add_alert_outlined),
      onPressed: () {},
    );
  }
}
