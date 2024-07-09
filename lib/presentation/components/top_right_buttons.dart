import 'package:flutter/material.dart';
import 'package:stap_board/presentation/screens/school_hub.dart';
import 'dart:html' as html;

class TopRightButtons extends StatefulWidget {
  const TopRightButtons({super.key});

  @override
  State<TopRightButtons> createState() => _TopRightButtonsState();
}

class _TopRightButtonsState extends State<TopRightButtons> {
  bool isFullscreen = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.purple,
                width: 1,
              ),
            ),
            child: IconButton(
                color: Colors.purple,
                onPressed: () {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: const Text(
                  //         'School hub feature is availabe out of demo mode.'),
                  //     action: SnackBarAction(
                  //       label: 'Ok',
                  //       onPressed: () {},
                  //     ),
                  //     duration: const Duration(seconds: 8),
                  //   ),
                  // );
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SchoolHub(),
                    ),
                  );
                },
                icon: const Icon(Icons.groups_outlined)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.purple,
                width: 1,
              ),
            ),
            child: IconButton(
                color: Colors.purple,
                onPressed: () {
                  if (isFullscreen) {
                    html.document.exitFullscreen();
                    setState(() {
                      isFullscreen = false;
                    });
                  } else {
                    html.document.documentElement!.requestFullscreen();
                    setState(() {
                      isFullscreen = true;
                    });
                  }
                },
                icon: Icon(isFullscreen
                    ? Icons.fullscreen_exit
                    : Icons.fullscreen_rounded)),
          ),
        ),
      ],
    );
  }
}
