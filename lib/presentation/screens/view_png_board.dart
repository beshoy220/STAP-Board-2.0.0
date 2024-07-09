import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/providers/background_image_settings.dart';
import 'package:stap_board/presentation/components/desktop_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

// This widget provide 2 lists of bytes and a background image that will be sent to the backend
// which is not a good or a professional practice but for our MVP it's totaly okay.
// conclusion: the needed endpoint would be able to take 2 list of bytes and an asset image
//
// Note: although we save the board in our backend but we need to save it too in a local storage
// so we can use it easily without connection.
//
// Note 2: the endpoint is not essintioal in the MVP as we will save in the local storage

class ViewPNGBoard extends StatefulWidget {
  final List<Uint8List?>? imageData;

  const ViewPNGBoard({Key? key, required this.imageData}) : super(key: key);

  @override
  State<ViewPNGBoard> createState() => _ViewPNGBoardState();
}

class _ViewPNGBoardState extends State<ViewPNGBoard> {
  bool uploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meta.colorPallet.grey100,
      body: Column(
        children: [
          const CustomTitleBar(),
          Stack(
            children: [
              Consumer<BackgroundImageSettings>(
                builder: (context, backgroundImageSettings, child) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration:
                          backgroundImageSettings.backgroundImagePath.isEmpty
                              ? null
                              : BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(backgroundImageSettings
                                        .backgroundImagePath),
                                    fit: BoxFit.fill,
                                  ),
                                ));
                },
              ),
              (widget.imageData!.isNotEmpty)
                  ? Stack(
                      children: [
                        (widget.imageData![0] != null)
                            ? Image.memory(
                                widget.imageData![0]!,
                              )
                            : const Text('n1'),
                        (widget.imageData![1] != null)
                            ? Image.memory(
                                widget.imageData![1]!,
                              )
                            : const Text('n2'),
                      ],
                    )
                  : const Text('n3'),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (!uploaded) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Board did not upload'),
                                    content: const Text(
                                        'Are you sure you want to get back ?\nNote that you did not upload the board yet.\n\nTo upload the board and view it later please click on Ok then click on the button up right.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Back and do\'t save',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          }
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded)),
                    Container(
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
                            // Upoad to backend function
                            setState(() {
                              uploaded = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    'The board has been saved succefuly. You can press back button now'),
                                action: SnackBarAction(
                                  label: 'Ok',
                                  onPressed: () {},
                                ),
                                duration: const Duration(seconds: 9),
                              ),
                            );
                          },
                          icon: const Icon(Icons.upload)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
