import 'package:drift_flutter/src/features/shared/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Users"),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentPage: PAGES.users,
      ),
    );
  }
}
