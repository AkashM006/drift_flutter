import 'package:drift_flutter/src/features/tasks/presentation/tasks.screen.dart';
import 'package:drift_flutter/src/features/users/presentation/users.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PAGES {
  home,
  users,
}

extension AppRoutesExtension on PAGES {
  String get path {
    switch (this) {
      case PAGES.home:
        return '/';
      case PAGES.users:
        return '/users';
    }
  }

  String get name {
    switch (this) {
      case PAGES.home:
        return "Tasks";
      case PAGES.users:
        return "Users";
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.home:
        return (context, routerState) => const TasksScreen();
      case PAGES.users:
        return (context, routerState) => const UsersScreen();
    }
  }
}

final List<RouteBase> routes = PAGES.values
    .map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        builder: route.builder,
      ),
    )
    .toList();

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: routes,
);
