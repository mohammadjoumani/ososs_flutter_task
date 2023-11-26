import 'package:flutter/material.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({
    super.key,
    required this.size,
    required this.backgroundColor,
    required this.shape,
    this.borderRadius,
    this.onTap,
  });

  final double size;
  final Color backgroundColor;
  final BoxShape shape;
  final double? borderRadius;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: shape,
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          onTap: onTap,
        ),
      ),
    );
  }
}
