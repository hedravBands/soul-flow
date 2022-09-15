import 'package:flutter/material.dart';

class HomeController {
  final PageController _pageController;
  int _currentIndex = 0;

  HomeController(this._pageController);

  int get currentIndex => _currentIndex;

  set setIndex(int i) {
    _currentIndex = i;
  }
}
