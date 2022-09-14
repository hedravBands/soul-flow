// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// This scenario demonstrates how to use redirect to handle a sign-in flow.
//
// The GoRouter.redirect method is called before the app is navigate to a
// new page. You can choose to redirect to a different page by returning a
// non-null URL string.

/// The login information.
class LoginInfo extends ChangeNotifier {
  String get userName => _userName;
  String _userName = '';

  /// Whether a user has logged in.
  bool get loggedIn => _userName.isNotEmpty;

  /// Logs in a user.
  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  /// Logs out the current user.
  void logout() {
    _userName = '';
    notifyListeners();
  }
}
