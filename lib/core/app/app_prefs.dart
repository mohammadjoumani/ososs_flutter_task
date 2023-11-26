// import 'dart:convert';
// import 'dart:ui';
// import 'package:provider_app/features/login/data/model/dto/response/login_response_dto.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../utils/resource/langauge_manager.dart';
//
// const String KEY_LANG = "KEY_LANG";
//
// const String KEY_IS_USER_LOGGED_IN = "KEY_IS_USER_LOGGED_IN";
// const String PREFS_KEY_ON_BOARDING_SCREEN_VIEWED =
//     "PREFS_KEY_ON_BOARDING_SCREEN_VIEWED";
//
// // user data key
// const String KEY_LOGIN_INFO = "KEY_LOGIN_INFO";
// const String KEY_TOKEN = "KEY_TOKEN";
// const String KEY_PAYER_NAME = "KEY_PAYER_NAME";
//
// const String KEY_PROVIDER_USER_INFO = "KEY_PROVIDER_USER_INFO";
//
// // const String PROVIDER_USER_INFO = "PROVIDER_USER_INFO";
// // const String SELECTED_PAYER_KEY = "SELECTED_PAYER_KEY";
//
// const String KEY_CAN_DO_CONSULTATION = "KEY_CAN_DO_CONSULTATION";
// const String KEY_CAN_DO_EMERGENCY = "KEY_CAN_DO_EMERGENCY";
//
// // Key Helper
// const String KEY_SEHATECH_ID = "KEY_SEHATECH_ID";
// const String KEY_PATIENT_ID = "KEY_PATIENT_ID";
//
// class AppPreferences {
//   final SharedPreferences _sharedPreferences;
//
//   AppPreferences(this._sharedPreferences);
//
//   // region Language
//   String getAppLanguage() {
//     String? language = _sharedPreferences.getString(KEY_LANG);
//     if (language != null && language.isNotEmpty) {
//       return language;
//     } else {
//       // return default lang
//       return LanguageType.ARABIC.getValue();
//     }
//   }
//
//   bool isEnglish() {
//     return getAppLanguage() == LanguageType.ENGLISH.getValue();
//   }
//
//   Future<void> changeAppLanguage() async {
//     String currentLang = getAppLanguage();
//
//     if (currentLang == LanguageType.ARABIC.getValue()) {
//       // set english
//       _sharedPreferences.setString(KEY_LANG, LanguageType.ENGLISH.getValue());
//     } else {
//       // set arabic
//       _sharedPreferences.setString(KEY_LANG, LanguageType.ARABIC.getValue());
//     }
//   }
//
//   Locale getLocal() {
//     String currentLang = getAppLanguage();
//
//     if (currentLang == LanguageType.ARABIC.getValue()) {
//       return ARABIC_LOCAL;
//     } else {
//       return ENGLISH_LOCAL;
//     }
//   }
//
//   //endregion
//
//   //region OnBoarding
//
//   Future<void> setOnBoardingScreenViewed() async {
//     _sharedPreferences.setBool(PREFS_KEY_ON_BOARDING_SCREEN_VIEWED, true);
//   }
//
//   bool isOnBoardingScreenViewed() {
//     return _sharedPreferences.getBool(PREFS_KEY_ON_BOARDING_SCREEN_VIEWED) ??
//         false;
//   }
//
//   //endregion
//
//   //region Login
//
//   Future<void> logout() async {
//     await _sharedPreferences.clear();
//   }
//
//   Future<void> setUserLogged() async {
//     _sharedPreferences.setBool(KEY_IS_USER_LOGGED_IN, true);
//   }
//
//   bool isUserLogged() {
//     return _sharedPreferences.getBool(KEY_IS_USER_LOGGED_IN) ?? false;
//   }
//
//   Future<void> setToken(String token) async {
//     _sharedPreferences.setString(KEY_TOKEN, token);
//   }
//
//   String getToken() {
//     return _sharedPreferences.getString(KEY_TOKEN) ?? "";
//   }
//
//   Future<void> setPayerName(String payerName) async {
//     _sharedPreferences.setString(KEY_PAYER_NAME, payerName);
//   }
//
//   String getPayerName() {
//     return _sharedPreferences.getString(KEY_PAYER_NAME) ?? "";
//   }
//
//   Future<void> setLoginInfo(LoginResponseDto loginResponseDto) async {
//     final loginInfo = loginResponseDto.toJson();
//     setToken(loginResponseDto.token!);
//     setPayerName(loginResponseDto.payerName!);
//     _sharedPreferences.setString(KEY_LOGIN_INFO, jsonEncode(loginInfo));
//   }
//
//   LoginResponseDto getLoginInfo() {
//     final jsonEncode = _sharedPreferences.getString(KEY_LOGIN_INFO) ?? "";
//     final loginInfo = json.decode(jsonEncode);
//     return LoginResponseDto.fromJson(loginInfo);
//   }
//
//   //endregion
//
//   // region Key Helper
//
//   Future<void> setSehaTechId(String sehatechId) async {
//     _sharedPreferences.setString(KEY_SEHATECH_ID, sehatechId);
//   }
//
//   String getSehaTechId() {
//     return _sharedPreferences.getString(KEY_SEHATECH_ID) ?? "";
//   }
//
//   Future<void> setPatientId(int patientId) async {
//     _sharedPreferences.setInt(KEY_PATIENT_ID, patientId);
//   }
//
//   int getPatientId() {
//     return _sharedPreferences.getInt(KEY_PATIENT_ID) ?? 0;
//   }
//
//   //endregion
//
//
//   Future<bool> canCreateConsultation() async {
//     return _sharedPreferences.getBool(KEY_CAN_DO_CONSULTATION) ?? false;
//   }
//
//   Future<bool> canCreateEmergency() async {
//     return _sharedPreferences.getBool(KEY_CAN_DO_EMERGENCY) ?? false;
//   }
// }
