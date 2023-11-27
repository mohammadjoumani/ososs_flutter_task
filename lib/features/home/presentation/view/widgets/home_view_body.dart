import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/color_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/font_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/routes_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';
import 'package:ososs_flutter_task/core/utils/widgets/generic_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        children: [
          const SizedBox(height: AppPadding.p16),

          // Input Name
          TextFormField(
            controller: _nameController,
            onChanged: (value) => setState(() {}),
            decoration: const InputDecoration(
              hintText: "Enter your name",
            ),
            onTapOutside: (value) => FocusScope.of(context).unfocus(),
          ),

          const SizedBox(height: AppPadding.p16),

          Text(
            _nameController.text,
            style: Styles.getMediumStyle(
                color: ColorManager.colorBlack, fontSize: FontSize.s16),
          ),

          const SizedBox(height: AppPadding.p16),

          const Spacer(),

          // Clear Button
          TextButton(
            onPressed: () {
              _nameController.clear();
            },
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
            onPressed: () {
              if (_nameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please enter your name"),
                  ),
                );
              } else {
                Navigator.pushNamed(context, Routes.animationsRoute,
                    arguments: {"name": _nameController.text});
              }
            },
            backgroundColor: ColorManager.colorPurple,
            textColor: ColorManager.colorWhite,
          ),

          const SizedBox(height: AppPadding.p16),

          // Navigate to page 2
          GenericButton(
            label: "Go to page 2",
            onPressed: () {
              Navigator.pushNamed(context, Routes.pokemonsRoute);
            },
            backgroundColor: ColorManager.colorCyan,
            textColor: ColorManager.colorWhite,
          ),

          const SizedBox(height: AppPadding.p16),
        ],
      ),
    );
  }
}
