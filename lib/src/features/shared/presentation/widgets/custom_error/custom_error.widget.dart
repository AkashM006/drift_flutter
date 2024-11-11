import 'package:drift_flutter/src/core/constants/app_offsets.dart';
import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    return ConstrainedBox(
      constraints: AppOffsets.messageWidthConstaint,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            size: SizeConfig.safeBlockVertical * 5,
            color: errorColor,
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: errorColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
