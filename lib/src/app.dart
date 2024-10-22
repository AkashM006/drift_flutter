import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container();
  }
}
