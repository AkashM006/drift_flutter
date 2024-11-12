import 'dart:async';

import 'package:drift_flutter/src/core/constants/settings.dart';
import 'package:drift_flutter/src/features/shared/presentation/drift_db.screen.dart';
import 'package:drift_flutter/src/features/shared/presentation/not_found.screen.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/debug_wrapper/debug_wrapper.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/new_task.screen.dart';
import 'package:drift_flutter/src/features/tasks/presentation/task_detail.screen.dart';
import 'package:drift_flutter/src/features/tasks/presentation/tasks.screen.dart';
import 'package:drift_flutter/src/features/users/presentation/users.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PAGES {
  home,
  users,
  taskCreate,
  taskDetail,
  driftDebug,
  notFound,
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
      case PAGES.driftDebug:
        return '/drift-debug';
      case PAGES.notFound:
        return '/*';
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
      case PAGES.driftDebug:
        return "Drift Debug";
      case PAGES.notFound:
        return "Not Found";
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
      case PAGES.driftDebug:
        return (context, routerState) => const DriftDbScreen();
      case PAGES.notFound:
        return (context, routerState) => const NotFoundScreen();
    }
  }

  FutureOr<String?> Function(BuildContext context, GoRouterState state)
      get redirect {
    switch (this) {
      case PAGES.driftDebug:
        return (context, routerState) {
          if (!kDebugMode) return PAGES.notFound.path;
          return null;
        };
      default:
        return (context, routerState) => null;
    }
  }
}

final List<RouteBase> routes = PAGES.values
    .map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        redirect: route.redirect,
        builder: (context, state) {
          final child = route.builder(context, state);
          if (kDebugMode &&
              (route.name != PAGES.driftDebug.name) &&
              !kHideDebugDb) {
            return DebuggerWrapper(child: child);
          }
          return child;
        },
      ),
    )
    .toList();

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: routes,
  errorBuilder: (context, state) {
    return const NotFoundScreen();
  },
);
