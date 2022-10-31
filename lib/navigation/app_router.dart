/*
* Developer: Abubakar Abdullahi
* Date: 17/06/2022
*/

import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/login_screen.dart';
import '../screens/screens.dart';
import 'app_link.dart';

class AppRouter extends RouterDelegate  <AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.initialized) SplashScreen.page(),
        if (appStateManager.initialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.completeOnboarding)
          OnboardingScreen.page(),
        if (appStateManager.completeOnboarding)
          HomePage.page(appStateManager.getSelectedTab),
        if (groceryManager.creatingNewItem)
          GroceryItemScreen.page(
              onCreate: (item) {
                groceryManager.addItem(item);
              },
              onUpdate: (item, index) {}),
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
              index: groceryManager.selectedIndex,
              item: groceryManager.selectedItem,
              onCreate: (_) {},
              onUpdate: (item, index) {
                groceryManager.updateItem(item, index);
              }),
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        if (profileManager.didTapOnRaywenderlich) WebViewScreen.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    // Handle splash and onboarding
    if (route.settings.name == RecipePages.onboardingPath) {
      appStateManager.logout();
    }
    // Handle state when user closes grocery item screen
    if (route.settings.name == RecipePages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    // Handle state when user closes profile screen
    if (route.settings.name == RecipePages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    // Handle state when user closes webview screen
    if (route.settings.name == RecipePages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }

    return true;
  }

  // convert app state to applink
  AppLink getCurrentPath() {
    if(!appStateManager.isLoggedIn){
      return AppLink(location: AppLink.kLoginPath);
    }else if(!appStateManager.completeOnboarding){
      return AppLink(location: AppLink.kOnboarding);
    }else if (profileManager.didSelectUser){
      return AppLink(location: AppLink.kProfilePath);
    }else if(groceryManager.creatingNewItem){
      return AppLink(location: AppLink.kItemPath);
    }else if(groceryManager.selectedItem != null){
      final id = groceryManager.selectedItem?.id;
      return AppLink(location: AppLink.kItemPath, itemId: id);
    }else{
      return AppLink(
        location: AppLink.kHomePath,
        currentTab: appStateManager.getSelectedTab,
      );
    }
  }

  // Apply configuration helper
  @override
  AppLink get currentConfiguration => getCurrentPath();

  @override
  Future<void> setNewRoutePath(AppLink newLink) async {
    switch (newLink.location){
      case AppLink.kProfilePath:
        profileManager.tapOnProfile(true);
        break;

      case AppLink.kItemPath:
        final itemId = newLink.itemId;
        if(itemId != null){
          groceryManager.setSelectedGroceryItem(itemId);
        }else{
          groceryManager.createNewItem();
        }
        profileManager.tapOnProfile(false);
        break;

      case AppLink.kHomePath:
        appStateManager.goToTab(newLink.currentTab ?? 0);
        profileManager.tapOnProfile(false);
        groceryManager.groceryItemTapped(-1);
        break;

      default:
        break;
    }
  }
}
