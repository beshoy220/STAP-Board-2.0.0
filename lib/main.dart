import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/providers/background_image_settings.dart';
import 'package:stap_board/data/providers/drawer_index.dart';
import 'package:stap_board/data/providers/paint_settings.dart';
import 'package:stap_board/data/providers/sticker_settings.dart';
import 'package:stap_board/data/start_up_window_data_for_desktop.dart';
import 'package:stap_board/presentation/screens/splash.dart';

// Before release:
// 1.TODO: There is no any implementation for backend connection via HTTPs and WS if needed.
// 2.TODO: Auth package (Should do all auth operation like creating token save it and read it..etc).
// 3.TODO: Save boards localy.
// 4.TODO: View boards localy in current class section in school hub.
// 5.TODO: Add more background images.
// 6.TODO: Add typography and modify meta class.
// 7.TODO: Add tooltips for some buttons.
// 8.TODO: Edit and modify draw tools pics and spacing and make it more flexable (maybe some animation if needed).
// 9.TO-FIX: Timer fix it by provider package and make 3 buttons for puase, start and change timer time countdown plus edit layout.
// 10.TO-Fix: Check ViewPNGBoard() widget comment at 'stap_board/presentation/components/view_png_board.dart' and fix it.
// 11.TO-Fix: Check and fix the lagy part during the upload and try using isolate package.

// Release notes:
// 1.The app is completely fine for Web and ready for release.
// 2.The app works on Windows OS but do not forget removing the import 'dart:html' library so it can work without errors.
// 3.For Lunix and MacOs there is very small implementation for bitsdojo_window package to work properly.
// 4.Need to check the app for Android OS as there was not any preparations for that.

void main() {
  runApp(const MyApp());
  startUpWindowData();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaintSettings()),
        ChangeNotifierProvider(create: (_) => StickerSettings()),
        ChangeNotifierProvider(create: (_) => BackgroundImageSettings()),
        ChangeNotifierProvider(create: (_) => DrawerIndex()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: meta.appName,
          theme: ThemeData(fontFamily: 'Imprima'),
          home: const SplashScreen()),
    );
  }
}
