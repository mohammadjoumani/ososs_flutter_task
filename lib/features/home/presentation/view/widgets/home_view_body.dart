import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_flutter_task/core/utils/resource/color_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/font_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/routes_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';
import 'package:ososs_flutter_task/core/utils/widgets/generic_button.dart';
import 'package:ososs_flutter_task/features/home/presentation/bloc/home_bloc.dart';

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
            onChanged: (value) {
              BlocProvider.of<HomeBloc>(context).add(ChangeNameEvent(value));
            },
            decoration: const InputDecoration(
              hintText: "Enter your name",
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),

          const SizedBox(height: AppPadding.p16),

          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Text(
                state.name,
                style: Styles.getMediumStyle(
                    color: ColorManager.colorBlack, fontSize: FontSize.s16),
              );
            },
          ),

          const SizedBox(height: AppPadding.p16),

          const Spacer(),

          // Clear Button
          TextButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(ClearTextEvent());
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
              _goToPage1(context);
            },
            backgroundColor: ColorManager.colorPurple,
            textColor: ColorManager.colorWhite,
          ),

          const SizedBox(height: AppPadding.p16),

          // Navigate to page 2
          GenericButton(
            label: "Go to page 2",
            onPressed: () {
              _goToPage2(context);
            },
            backgroundColor: ColorManager.colorCyan,
            textColor: ColorManager.colorWhite,
          ),

          const SizedBox(height: AppPadding.p16),
        ],
      ),
    );
  }

  void _goToPage1(BuildContext context) {
    Navigator.pushNamed(context, Routes.animationsRoute);
  }

  void _goToPage2(BuildContext context) {
    Navigator.pushNamed(context, Routes.pokemonsRoute);
  }
}
