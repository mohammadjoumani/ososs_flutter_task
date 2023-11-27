import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/color_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/font_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';
import 'package:ososs_flutter_task/features/animations/presentation/view/widgets/custom_shape.dart';

class AnimationsViewBody extends StatefulWidget {
  const AnimationsViewBody({super.key, required this.name});

  final String name;

  @override
  State<AnimationsViewBody> createState() => _AnimationsViewBodyState();
}

class _AnimationsViewBodyState extends State<AnimationsViewBody> {
  BoxDecoration decoration = BoxDecoration(
    color: ColorManager.colorRed,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(AppSize.s190),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              widget.name,
              style: Styles.getMediumStyle(
                  color: ColorManager.colorBlack, fontSize: FontSize.s16),
            ),
          ),
          Center(
            child: AnimatedContainer(
              width: AppSize.s300,
              height: AppSize.s300,
              decoration: decoration,
              duration: const Duration(milliseconds: 400),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShape(
                  size: AppSize.s100,
                  backgroundColor: ColorManager.colorPurple,
                  shape: BoxShape.rectangle,
                  onTap: () {
                    setState(() {
                      decoration = BoxDecoration(
                        color: ColorManager.colorPurple,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppSize.s0),
                      );
                    });
                  },
                ),
                CustomShape(
                  size: AppSize.s100,
                  backgroundColor: ColorManager.colorCyan,
                  shape: BoxShape.rectangle,
                  borderRadius: AppSize.s20,
                  onTap: () {
                    setState(() {
                      decoration = BoxDecoration(
                        color: ColorManager.colorCyan,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppSize.s40),
                      );
                    });
                  },
                ),
                CustomShape(
                  size: AppSize.s100,
                  backgroundColor: ColorManager.colorRed,
                  shape: BoxShape.circle,
                  onTap: () {
                    setState(() {
                      decoration = BoxDecoration(
                        color: ColorManager.colorRed,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(AppSize.s190),
                      );
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
