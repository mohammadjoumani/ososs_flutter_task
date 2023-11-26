import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/color_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/font_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';
import 'package:ososs_flutter_task/core/utils/widgets/generic_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        children: [
          const SizedBox(height: AppPadding.p16),

          //Input field
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter your name",
            ),
          ),

          const SizedBox(height: AppPadding.p16),

          Text(
            "Your Name",
            style: Styles.getMediumStyle(
                color: ColorManager.colorBlack1, fontSize: FontSize.s16),
          ),

          const SizedBox(height: AppPadding.p16),

          const Spacer(),

          // Clear Button
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.delete, color: ColorManager.colorRed),
                const SizedBox(width: AppPadding.p8),
                Text(
                  "Clear text",
                  style: Styles.getMediumStyle(color: ColorManager.colorRed),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppPadding.p16),

          // Navigate to page 1
          GenericButton(
            label: "Go to page 1",
            onPressed: () {},
            backgroundColor: ColorManager.colorPrimary,
            textColor: ColorManager.colorWhite,
          ),

          const SizedBox(height: AppPadding.p16),

          // Navigate to page 2
          GenericButton(
            label: "Go to page 2",
            onPressed: () {},
            backgroundColor: ColorManager.colorPrimary,
            textColor: ColorManager.colorWhite,
          ),
          const SizedBox(height: AppPadding.p16),
        ],
      ),
    );
  }
}
