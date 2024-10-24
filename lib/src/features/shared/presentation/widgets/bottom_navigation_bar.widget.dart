import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<Map<String, dynamic>> items = [
  {
    'page': PAGES.home,
    'icon': Icons.task_outlined,
    'selected_icon': Icons.task_rounded,
  },
  {
    'page': PAGES.users,
    'icon': Icons.people_outline_rounded,
    'selected_icon': Icons.people_rounded,
  },
];

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.currentPage,
  });

  final PAGES currentPage;

  @override
  Widget build(BuildContext context) {
    final navigationItems = items
        .map(
          (e) => NavigationDestination(
            icon: Icon(e['icon']),
            selectedIcon: Icon(e['selected_icon']),
            label: (e['page'] as PAGES).name,
          ),
        )
        .toList();

    void handleNavigation(int index) {
      final newPage = items[index]['page'] as PAGES;

      context.go(newPage.path);
    }

    return NavigationBar(
      destinations: navigationItems,
      selectedIndex: items.indexWhere(
        (item) => item['page'] == currentPage,
      ),
      onDestinationSelected: handleNavigation,
    );
  }
}
