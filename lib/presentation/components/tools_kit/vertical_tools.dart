import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/providers/drawer_index.dart';
import 'package:stap_board/data/providers/paint_settings.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/choose_color.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/choose_pen_tool.dart';
import 'package:text_scroll/text_scroll.dart';

class VerticalTools extends StatefulWidget {
  const VerticalTools({super.key});

  @override
  State<VerticalTools> createState() => _VerticalToolsState();
}

class _VerticalToolsState extends State<VerticalTools> {
  bool viewPenToolsOrColors = false;
  int selectedToolIndex = 0;
  List<List> tools = [
    ['Pen tool', Icons.draw_outlined],
    ['Eraser', Icons.panorama_wide_angle_outlined],
    ['Colors', Icons.color_lens_outlined],
    ['Text', Icons.text_format],
    ['   3D shapes', Icons.threed_rotation_rounded],
    ['Shapes', Icons.pentagon_outlined],
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: meta.colorPallet.pureWhite,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(
                              thickness: 3,
                            ),
                          ),
                          Consumer<DrawerIndex>(
                              builder: (context, drawerIndex, child) {
                            return ListView.builder(
                              itemCount: tools.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Consumer<PaintSettings>(
                                    builder: (context, paintSettings, child) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (index == 0 || index == 2) {
                                          viewPenToolsOrColors =
                                              !viewPenToolsOrColors;
                                        }

                                        selectedToolIndex = index;
                                      });
                                      switch (index) {
                                        case 1:
                                          paintSettings.eraser();
                                          break;

                                        case 3:
                                          drawerIndex.setDrawerIndex(0);
                                          Scaffold.of(context).openEndDrawer();
                                          break;
                                        case 4:
                                          drawerIndex.setDrawerIndex(2);
                                          Scaffold.of(context).openEndDrawer();
                                          break;
                                        case 5:
                                          drawerIndex.setDrawerIndex(1);
                                          Scaffold.of(context).openEndDrawer();
                                          break;
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: selectedToolIndex == index
                                                ? meta.colorPallet.primary200
                                                : meta.colorPallet.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Tooltip(
                                            message: tools[index][0],
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 8),
                                                Icon(
                                                  tools[index][1],
                                                  size: 28,
                                                  color: meta
                                                      .colorPallet.primary500,
                                                ),
                                                TextScroll(
                                                  tools[index][0],
                                                  velocity: const Velocity(
                                                      pixelsPerSecond:
                                                          Offset(30, 0)),
                                                  style: TextStyle(
                                                      color: meta.colorPallet
                                                          .primary700),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: meta.colorPallet.pureWhite,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
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
                      physics: const BouncingScrollPhysics(),
                      child: Consumer<PaintSettings>(
                          builder: (context, paintSettings, child) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Tooltip(
                                  message: 'Undo draw',
                                  child: InkWell(
                                    onTap: () {
                                      paintSettings.undo();
                                    },
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Icon(
                                          Icons.reply,
                                          size: 28,
                                          color: meta.colorPallet.primary500,
                                        ),
                                        TextScroll(
                                          'Undo',
                                          style: TextStyle(
                                              color:
                                                  meta.colorPallet.primary600),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Tooltip(
                                message: 'Clear all',
                                child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Clear all'),
                                            content: const Text(
                                                'By clicking clear button you will delete all drawings you already draw and start from scratch a new board.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Back'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  paintSettings.clear();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Clear all'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Icon(
                                          Icons.delete_outline_rounded,
                                          size: 28,
                                          color: meta.colorPallet.primary500,
                                        ),
                                        TextScroll(
                                          'Clear all',
                                          style: TextStyle(
                                              color:
                                                  meta.colorPallet.primary600),
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        );
                      })),
                ),
              ),
            )
          ],
        ),
        (selectedToolIndex == 0 && viewPenToolsOrColors)
            ? ChoosePenTool(
                isFinished: (finished) {
                  setState(() {
                    viewPenToolsOrColors = !viewPenToolsOrColors;
                  });
                },
              )
            : const Center(),
        (selectedToolIndex == 2 && viewPenToolsOrColors)
            ? ChooseColor(
                isFinished: (finished) {
                  setState(() {
                    viewPenToolsOrColors = !viewPenToolsOrColors;
                  });
                },
              )
            : const Center()
      ],
    );
  }
}
