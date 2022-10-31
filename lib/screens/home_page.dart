import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/explore_screen.dart';
import '../screens/grocery_screen.dart';
import '../screens/recipe_screen.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  static MaterialPage page(currentTab){
    return MaterialPage(
        name: RecipePages.home,
        key: ValueKey(RecipePages.home),
        child: HomePage(currentTab: currentTab),
    );
  }
  const HomePage({Key? key, required this.currentTab,}) : super(key: key);
  final int currentTab;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Widget> pages = <Widget>[
     ExploreScreen(),
    RecipeScreen(),
    const GroceryScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(builder: (context, appStateManager, child ){
      return Scaffold(
        appBar: AppBar(
          title: Text('Recipe App', style: Theme.of(context).textTheme.headline6,),
          actions: [
            profileButton(),
          ],
        ),
        body: IndexedStack(index: widget.currentTab, children: pages,),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.currentTab,
          onTap: (index){
            Provider.of<AppStateManager>(context, listen: false).goToTab(index);
          },
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipe'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To buy'),
          ],
        ),
      );
    });

  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/ab.jpg',
          ),
        ),
        onTap: () {
          Provider.of<ProfileManager>(context, listen: false).tapOnProfile(true);
        },
      ),
    );
  }
}
