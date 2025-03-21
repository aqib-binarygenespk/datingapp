import 'package:flutter/material.dart';
import 'package:dating_app/Dashbaord/chat.dart';
import 'package:dating_app/Dashbaord/pairup/pairup.dart';
import 'package:dating_app/Dashbaord/profile.dart';
import 'package:dating_app/Dashbaord/search.dart';
import 'package:dating_app/Dashbaord/settings.dart';
import 'package:dating_app/Dashbaord/pairup/pairupdetailscreen.dart';
import 'package:dating_app/Dashbaord/pairup/addevent.dart';

class DashboardScreen extends StatefulWidget {
  final int selectedIndex;
  final Widget? detailScreen; // Accepts any screen dynamically

  const DashboardScreen({Key? key, this.selectedIndex = 0, this.detailScreen})
      : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  late int _currentIndex;
  late PageController _pageController; // Late initialization
  Widget _currentSearchScreen = SearchScreen();
  Widget _currentPairUpScreen = const PairUp(); // Default PairUp Screen

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    _pageController = PageController(initialPage: _currentIndex); // ✅ Fix: Set initial page

    // If navigating to Search tab with profile details, show DetailProfileScreen
    if (widget.selectedIndex == 1 && widget.detailScreen != null) {
      _currentSearchScreen = widget.detailScreen!;
    }

    // If navigating to PairUp tab with event details or Add Event, update accordingly
    if (widget.selectedIndex == 2 && widget.detailScreen != null) {
      _currentPairUpScreen = widget.detailScreen!;
    }
  }

  // Function to update Search tab dynamically
  void updateSearchScreen(Widget screen) {
    setState(() {
      _currentSearchScreen = screen;
    });
  }

  // Function to update PairUp tab dynamically
  void updatePairUpScreen(Widget screen) {
    setState(() {
      _currentPairUpScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController, // ✅ Now it correctly starts at the selected tab
        physics: const NeverScrollableScrollPhysics(), // Prevent swipe navigation
        children: [
          const ProfileScreen(),
          _currentSearchScreen, // Dynamically update search tab
          _currentPairUpScreen, // Dynamically update PairUp tab
          const ChatScreen(),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index); // ✅ Ensure smooth navigation

            // Reset Search when clicking Search tab
            if (index == 1) {
              _currentSearchScreen = SearchScreen();
            }

            // Reset PairUp when clicking PairUp tab
            if (index == 2) {
              _currentPairUpScreen = const PairUp();
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "PairUp"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
