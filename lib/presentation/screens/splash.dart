import 'package:flutter/material.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/presentation/components/desktop_buttons.dart';
import 'package:stap_board/presentation/screens/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
        builder: (BuildContext context) => const AuthScrren(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meta.colorPallet.primary700,
      body: Column(
        children: [
          const CustomTitleBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 56 / 1.6,
                        height: 120 / 1.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          meta.appName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          ' Board',
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                      ],
                    ),
                    const Text(
                      'Draw, Illustrate, innovate and teach like never before for',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w100),
                    ),
                    const Text(
                      'much better experience',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  'Version ${meta.appVersion}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Text(
                  meta.appSlogan,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
