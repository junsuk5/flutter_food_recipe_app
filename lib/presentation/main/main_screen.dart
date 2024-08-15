import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  final int currentPageIndex;
  final ValueChanged<int> onDestinationSelected;

  const MainScreen({
    super.key,
    required this.child,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 58,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        destinations: [
          NavigationDestination(
              icon: Image.asset('assets/images/unselected_home.png'),
              selectedIcon: Image.asset(
                'assets/images/selected_home.png',
              ),
              label: 'home'),
          NavigationDestination(
            icon: Image.asset('assets/images/unselected_book_mark.png'),
            selectedIcon: Image.asset('assets/images/selected_book_mark.png'),
            label: 'saved',
          ),
          NavigationDestination(
              icon: Image.asset('assets/images/unselected_alert.png'),
              selectedIcon: Image.asset('assets/images/selected_alert.png'),
              label: 'notifications'),
          NavigationDestination(
              icon: Image.asset('assets/images/unselected_man.png'),
              selectedIcon: Image.asset('assets/images/selected_man.png'),
              label: 'profile')
        ],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          onDestinationSelected(index);
        },
      ),
    );
  }
}
