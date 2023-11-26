// import 'package:flutter/material.dart';
//
// import 'color_manager.dart';
// import 'font_manager.dart';
// import 'style_manager.dart';
// import 'values_manager.dart';
//
// abstract class MainThemeApp {
//   late ThemeData themeData;
// }
//
// class LightModeTheme implements MainThemeApp {
//   @override
//   ThemeData themeData = ThemeData(
//     primaryColor: ColorManager.colorPrimary,
//     // cardColor: Palette.colorCardLight,
//     scaffoldBackgroundColor: ColorManager.colorBackground,
//     textSelectionTheme: const TextSelectionThemeData(
//       cursorColor: ColorManager.colorPrimary,
//       selectionHandleColor: ColorManager.colorPrimary,
//       selectionColor: ColorManager.colorPrimary1,
//     ),
//     disabledColor: ColorManager.colorDisable,
//     splashColor: ColorManager.colorPrimary1,
//
//     // Text color
//     // primaryColorLight: Palette.colorFontPrimaryLight,
//     // primaryColorDark: Palette.colorFontSecondaryLight,
//
//     // hintColor: Palette.colorPlaceHolderLight,
//     //
//     // shadowColor: Palette.colorBackgroundDark,
//
//     fontFamily: FontConstants.fontCairo,
//
//     progressIndicatorTheme: const ProgressIndicatorThemeData(
//       color: ColorManager.colorPrimary,
//       circularTrackColor: ColorManager.colorPrimary1,
//     ),
//
//     colorScheme: ColorScheme.fromSwatch(
//       accentColor:
//           ColorManager.colorPrimary, // but now it should be declared like this
//     ),
//
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: ColorManager.colorBackground,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: ColorManager.colorPrimary,
//       unselectedItemColor: ColorManager.colorBlack1,
//       selectedLabelStyle: Styles.getRegularStyle(
//           fontSize: FontSize.s12, color: ColorManager.colorPrimary),
//       unselectedLabelStyle: Styles.getRegularStyle(
//           fontSize: FontSize.s12, color: ColorManager.colorBlack1),
//     ),
//
//     bottomSheetTheme: const BottomSheetThemeData(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(16),
//         ),
//       ),
//     ),
//
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       elevation: 0,
//       backgroundColor: ColorManager.colorWhite,
//       iconTheme: const IconThemeData(
//           color: ColorManager.colorBlack1, size: AppSize.s24),
//       actionsIconTheme: const IconThemeData(
//           color: ColorManager.colorGray1, size: AppSize.s24),
//       titleSpacing: AppPadding.p16,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(AppSize.s8),
//         ),
//       ),
//       titleTextStyle: Styles.getSemiBoldStyle(
//               color: ColorManager.colorBlack1, fontSize: FontSize.s16)
//           .copyWith(fontFamily: FontConstants.fontCairo),
//     ),
//
//     // elevatedButtonTheme: ElevatedButtonThemeData(
//     //   style: ElevatedButton.styleFrom(
//     //     minimumSize: const Size(double.infinity, 48),
//     //     elevation: 0,
//     //     backgroundColor: ColorManager.colorPrimary,
//     //     shape: RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //   ),
//     // ),
//
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         elevation: 0,
//         foregroundColor: ColorManager.colorGray1,
//       ),
//     ),
//     // input decoration theme (text form field)
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: ColorManager.colorWhite,
//       contentPadding: const EdgeInsets.symmetric(
//           horizontal: AppPadding.p8, vertical: AppPadding.p8),
//       // hint style
//       hintStyle: Styles.getRegularStyle(color: ColorManager.colorGray1),
//       // labelStyle: Styles.getRegularStyle(color: Palette.black4, fontSize: FontSize.s14),
//       errorStyle: Styles.getRegularStyle(color: ColorManager.colorRed),
//
//       // enabled border style
//       enabledBorder: const OutlineInputBorder(
//         borderSide:
//             BorderSide(color: ColorManager.colorGray2, width: AppSize.s1),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//
//       // disable border style
//       disabledBorder: const OutlineInputBorder(
//         borderSide:
//             BorderSide(color: ColorManager.colorGray2, width: AppSize.s1),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//
//       // focused border style
//       focusedBorder: const OutlineInputBorder(
//         borderSide:
//             BorderSide(color: ColorManager.colorGray2, width: AppSize.s1),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//
//       // error border style
//       errorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.colorRed, width: AppSize.s1),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//       // focused border style
//       focusedErrorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.colorRed, width: AppSize.s1),
//         borderRadius: BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//     ),
//   );
// }
