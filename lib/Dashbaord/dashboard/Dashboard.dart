import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating_app/Dashbaord/chat/chat.dart';
import 'package:dating_app/Dashbaord/pairupscreens/pairup/pairup.dart';
import 'package:dating_app/Dashbaord/profile/profile.dart';
import 'package:dating_app/Dashbaord/search/search.dart';
import 'package:dating_app/Dashbaord/settings/settings.dart';

class DashboardScreen extends StatefulWidget {
  final int selectedIndex;
  final Widget? detailScreen;

  const DashboardScreen({Key? key, this.selectedIndex = 0, this.detailScreen})
      : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  late int _currentIndex;
  late PageController _pageController;
  Widget _currentSearchScreen = SearchScreen();
  Widget _currentPairUpScreen = const PairUp();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    _pageController = PageController(initialPage: _currentIndex);

    Get.put(this);

    if (widget.selectedIndex == 1 && widget.detailScreen != null) {
      _currentSearchScreen = widget.detailScreen!;
    }
    if (widget.selectedIndex == 2 && widget.detailScreen != null) {
      _currentPairUpScreen = widget.detailScreen!;
    }
  }

  void updateSearchScreen(Widget screen) {
    setState(() {
      _currentSearchScreen = screen;
    });
  }

  void updatePairUpScreen(Widget screen) {
    setState(() {
      _currentPairUpScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const ProfileScreen(),
          _currentSearchScreen,
          _currentPairUpScreen,
          const ChatScreen(),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: isKeyboardVisible
          ? const SizedBox.shrink()
          : ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);

              if (index == 1) _currentSearchScreen = SearchScreen();
              if (index == 2) _currentPairUpScreen = const PairUp();
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          backgroundColor: const Color(0xFFFFEFEF),
          selectedLabelStyle: const TextStyle(
            fontSize: 12, // ✅ fixed font size for selected label
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12, // ✅ fixed font size for unselected label
          ),
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "Search"),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/pairupbottom.png'),
              ),
              label: "PairUp",
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.chat), label: "Chat"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
