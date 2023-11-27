import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/color_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';

class GenericFailureMessage extends StatelessWidget {
  const GenericFailureMessage(
      {Key? key, required this.message, required this.onPressed})
      : super(key: key);

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message,
          style: Styles.getMediumStyle(color: ColorManager.colorRed),
        ),
        const SizedBox(height: AppPadding.p8),
        OutlinedButton(
          onPressed: onPressed,
          child: const Text("Retry"),
        )
      ],
    );
  }
}
