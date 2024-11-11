import 'package:drift_flutter/src/features/tasks/presentation/new_task.screen.dart';
import 'package:drift_flutter/src/features/tasks/presentation/task_detail.screen.dart';
import 'package:drift_flutter/src/features/tasks/presentation/tasks.screen.dart';
import 'package:drift_flutter/src/features/users/presentation/users.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PAGES {
  home,
  users,
  taskCreate,
  taskDetail,
}

extension AppRoutesExtension on PAGES {
  String get path {
    switch (this) {
      case PAGES.home:
        return '/';
      case PAGES.users:
        return '/users';
      case PAGES.taskCreate:
        return '/new-task';
      case PAGES.taskDetail:
        return '/task-detail';
    }
  }

  String get name {
    switch (this) {
      case PAGES.home:
        return "Tasks";
      case PAGES.users:
        return "Users";
      case PAGES.taskCreate:
        return "New Task";
      case PAGES.taskDetail:
        return "Task Detail";
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.home:
        return (context, routerState) => const TasksScreen();
      case PAGES.users:
        return (context, routerState) => const UsersScreen();
      case PAGES.taskCreate:
        return (context, routerState) => const NewTaskScreen();
      case PAGES.taskDetail:
        return (context, routerState) {
          final id = routerState.uri.queryParameters['id'];
          int? idResult;
          if (id != null) idResult = int.tryParse(id);

          return TaskDetailScreen(id: idResult);
        };
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
