import 'package:flutter/material.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/presentation/components/desktop_buttons.dart';

class SmallScreensMSG extends StatelessWidget {
  const SmallScreensMSG({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: meta.colorPallet.primary700,
      body: Column(
        children: [
          const CustomTitleBar(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'Ops, it seems that you are trying to access STAP Board on small screen device (Mobile, Small tablet or Desktop on mini view)\nWe designed The app to work on large screens like desktop or school boards please try bigger screen\nCurrent screen width size:$screenSizeWidth',
                    style: TextStyle(color: meta.colorPallet.pureWhite),
                  ),
                  const SizedBox(height: 20),
                  Text(
                      'We are working on STAP Board for small screen sizes in next versions.\nFor any question or contact please do not hesitate',
                      style: TextStyle(color: meta.colorPallet.pureWhite)),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 5),
                          Text('Contact us'),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
