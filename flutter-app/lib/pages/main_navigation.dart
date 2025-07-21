import 'package:flutter/cupertino.dart';
import 'dashboard_page.dart';
import 'diet_planning_page.dart';
import 'barcode_scanner_page.dart';
import 'chat_page.dart';
import 'profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    DashboardPage(),
    DietPlanningPage(),
    BarcodeScannerPage(),
    ChatPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    print('Button tapped!');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        activeColor: CupertinoColors.systemGreen,
        inactiveColor: CupertinoColors.systemGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.qrcode),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => _pages[index],
        );
      },
    );
  }
} 