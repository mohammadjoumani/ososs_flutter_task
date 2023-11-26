import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ososs_flutter_task/core/app/app.dart';

import 'core/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  await initAppModule();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const OsossApp(), // Wrap your app
    ),
  );
}
