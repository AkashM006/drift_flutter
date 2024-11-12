import 'package:drift_flutter/src/core/constants/app_offsets.dart';
import 'package:drift_flutter/src/core/constants/settings.dart';
import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    AppOffsets.init(context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kSeedColor,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kSeedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
    );
  }
}
