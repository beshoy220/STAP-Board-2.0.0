import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/providers/drawer_index.dart';
import 'package:stap_board/data/providers/paint_settings.dart';
import 'package:stap_board/data/providers/sticker_settings.dart';
import 'package:stap_board/logic/convert_to_byte_png.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/timer.dart';
import 'package:stap_board/presentation/screens/view_png_board.dart';
import 'package:text_scroll/text_scroll.dart';

class HorizontalTools extends StatefulWidget {
  const HorizontalTools({super.key});

  @override
  State<HorizontalTools> createState() => _HorizontalToolsState();
}

class _HorizontalToolsState extends State<HorizontalTools> {
  bool miniView = false;
  bool isFirstTimeToUseMiniView = true;
  double width = 120;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInQuad,
              width: isFirstTimeToUseMiniView
                  ? MediaQuery.of(context).size.width / 3
                  : width,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: meta.colorPallet.pureWhite,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: 80 / 3,
                            height: double.maxFinite / 3,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/logo2.png'),
                                    fit: BoxFit.fitHeight)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: VerticalDivider(),
                        )
                      ],
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInQuad,
                      width: miniView
                          ? 0
                          : (MediaQuery.of(context).size.width / 3) - 120,
                      height: double.maxFinite,
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                  width: 140,
                                  child: TextScroll(
                                    '         Grade 12 - Class A',
                                    velocity: Velocity(
                                        pixelsPerSecond: Offset(30, 0)),
                                  )),
                              Consumer<StickerSettings>(
                                  builder: (context, stickerSettings, child) {
                                return Consumer<DrawerIndex>(
                                    builder: (context, drawerIndex, child) {
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: IconButton(
                                          tooltip: 'Backround',
                                          onPressed: () {
                                            drawerIndex.setDrawerIndex(3);
                                            Scaffold.of(context)
                                                .openEndDrawer();
                                          },
                                          icon: Icon(
                                            Icons.camera_outlined,
                                            size: 28,
                                            color: meta.colorPallet.primary500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: IconButton(
                                          tooltip: 'Timer',
                                          onPressed: () {
                                            stickerSettings
                                                .addSticker(const Timer());
                                          },
                                          icon: Icon(
                                            Icons.timer_outlined,
                                            size: 28,
                                            color: meta.colorPallet.primary500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: IconButton(
                                          tooltip: 'Clock',
                                          onPressed: () {
                                            stickerSettings.addSticker(
                                              const SizedBox(
                                                width: 250,
                                                height: 250,
                                                child: AnalogClock(),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.access_time_sharp,
                                            size: 28,
                                            color: meta.colorPallet.primary500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Consumer<PaintSettings>(builder:
                                            (context, paintSettings, child) {
                                          return IconButton(
                                            tooltip: 'Export to class',
                                            onPressed: () {
                                              bool convertToPNGInprogress =
                                                  false;

                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Export to class'),
                                                    content: const Text(
                                                        'By clicking export to class button you will Upload the current drawing to the class.'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Back'),
                                                      ),
                                                      Consumer<StickerSettings>(
                                                        builder: (context,
                                                                stickerSettings,
                                                                child) =>
                                                            FutureBuilder(
                                                          future:
                                                              convertToUnit8List(
                                                                  paintSettings,
                                                                  stickerSettings),
                                                          builder: (context,
                                                                  snapshot) =>
                                                              TextButton(
                                                            onPressed:
                                                                () async {
                                                              // ignore: use_build_context_synchronously
                                                              if (snapshot.data!
                                                                  .isNotEmpty) {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                  MaterialPageRoute(
                                                                    builder: (_) =>
                                                                        ViewPNGBoard(
                                                                      imageData:
                                                                          snapshot
                                                                              .data,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: convertToPNGInprogress
                                                                // ignore: dead_code
                                                                ? const CircularProgressIndicator()
                                                                : const Text('Export to class'),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.near_me_outlined,
                                              size: 28,
                                              color:
                                                  meta.colorPallet.primary500,
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  );
                                });
                              })
                            ],
                          )),
                    ),
                    Center(
                      child: IconButton(
                        icon: miniView
                            ? const Icon(Icons.keyboard_double_arrow_right)
                            : const Icon(Icons.keyboard_double_arrow_left),
                        onPressed: () {
                          setState(() {
                            if (miniView) {
                              miniView = false;
                              width = MediaQuery.of(context).size.width / 3;

                              // widget.isMiniView(false);
                            } else {
                              isFirstTimeToUseMiniView = false;
                              miniView = true;
                              width = 120;
                              // widget.isMiniView(true);
                            }
                          });
                        },
                        color: meta.colorPallet.primary500,
                      ),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}
