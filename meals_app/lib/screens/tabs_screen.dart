import 'package:flutter/material.dart';
import './categories_screem.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];

  int _selectedPAgeIndex = 0;

  // method for the second way to create a tapbar
  void _selectPage(int index) {
    setState(() {
      _selectedPAgeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for this approach there is no need of StatefulWidget
    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Meals'),
    //         bottom: TabBar(
    //           tabs: <Widget>[
    //             Tab(icon: Icon(Icons.category), text: 'Categories'),
    //             Tab(icon: Icon(Icons.start), text: 'Favorites'),
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: <Widget>[
    //           CategoriesScreen(),
    //           FavoritesScreen(),
    //         ],
    //       ),
    //     ));

    // second way to add a tapbar. Here I have to control which tab which page will open
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPAgeIndex]['title']),
      ),
      body: _pages[_selectedPAgeIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          // this backgroundColor will be not needed if I use BottomNavigationBarTypeZ
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          // selectedFontSize: _selectedPAgeIndex.toDouble(),
          // type: BottomNavigationBarType.shifting,
          currentIndex: _selectedPAgeIndex,
          items: [
            BottomNavigationBarItem(
              // this is needed only of the BottomNavigationBarType.shifting, is using
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              // this is needed only of the BottomNavigationBarType.shifting, is using
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ]),
    );
  }
}
