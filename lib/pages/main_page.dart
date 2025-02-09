import 'package:flutter/material.dart';
import 'package:image_panel/pages/accounts_page.dart';
import 'package:image_panel/pages/explore_page.dart';
import 'package:image_panel/pages/home_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 bool _isVisible = true;
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
       HomePage(
        afterScrollResult: afterScrollResult,
       ),
      const ExplorePage(),
      const AccountsPage(),
    ];
  }

  afterScrollResult(bool visibility){
    setState(() {
      _isVisible = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible? 80 : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              
              elevation: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black45,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
            
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.account_box_rounded),
                  label: 'Accounts',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
