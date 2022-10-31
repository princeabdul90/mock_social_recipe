import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  final _groceryItems = <GroceryItem>[];
  int _selectedIndex = -1;
  bool _createNewItem = false;

  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);
  bool get creatingNewItem => _createNewItem;
  int get selectedIndex => _selectedIndex;
  GroceryItem? get selectedItem => _selectedIndex != -1 ? _groceryItems[_selectedIndex] : null;

  void createNewItem(){
    _createNewItem = true;
    notifyListeners();
  }

  void groceryItemTapped(index){
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void setSelectedGroceryItem(String id){
    final index = groceryItems.indexWhere((element) => element.id == id);
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void deleteItem(int index){
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    _createNewItem = false;
    _selectedIndex = -1;
    notifyListeners();
  }

  void completeItem(int index, bool change){
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}