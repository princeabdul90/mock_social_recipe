import 'package:flutter/material.dart';
import '../models/models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
      firstName: 'Abu',
      lastName: 'Abdul',
      role: 'Flutterist',
      profileImageUrl: 'assets/profile_pics/ab.jpg',
      points: 100,
      darkMode: _darkMode,
  );

  var _darkMode = false;
  var _selectedUser = false;
  var _tapOnRaywenderlich = false;

  bool get darkMode => _darkMode;
  bool get didTapOnRaywenderlich => _tapOnRaywenderlich;
  bool get didSelectUser => _selectedUser;

  void set darkMode(darkMode){
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnRaywenderlich(select){
    _tapOnRaywenderlich = select;
    notifyListeners();
  }

  void tapOnProfile(selected){
    _selectedUser = selected;
    notifyListeners();
  }



}