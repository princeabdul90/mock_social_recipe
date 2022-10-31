import 'dart:async';
import 'package:flutter/material.dart';
import '../models/app_cache.dart';

class RecipesTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialize = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = RecipesTab.explore;
  final _appCache = AppCache();

  bool get initialized => _initialize;
  bool get isLoggedIn => _loggedIn;
  bool get completeOnboarding => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializedApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();

    Timer(const Duration(milliseconds: 2000), () {
      _initialize = true;
      notifyListeners();
    });
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipe() {
    _selectedTab = RecipesTab.recipes;
    notifyListeners();
  }

  void onboardingComplete() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void logout() async {
    _initialize = false;
    _selectedTab = 0;
    await _appCache.invalidate();

    initializedApp();
    notifyListeners();
  }

}
