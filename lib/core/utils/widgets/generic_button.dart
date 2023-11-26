import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s48,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Styles.getSemiBoldStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
