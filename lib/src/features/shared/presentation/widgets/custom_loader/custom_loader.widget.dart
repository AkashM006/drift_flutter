import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.safeBlockVertical * 3.5,
          child: const AspectRatio(
            aspectRatio: 1,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
        if (text != null)
          SizedBox(
            height: SizeConfig.safeBlockVertical * 1.5,
          ),
        if (text != null) Text(text!)
      ],
    );
  }
}
