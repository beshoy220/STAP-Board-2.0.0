import 'package:flutter/material.dart';
import 'package:lindi_sticker_widget/lindi_sticker_widget.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/providers/background_image_settings.dart';
import 'package:stap_board/data/providers/drawer_index.dart';
import 'package:stap_board/data/providers/paint_settings.dart';
import 'package:stap_board/data/providers/sticker_settings.dart';
import 'package:stap_board/presentation/components/desktop_buttons.dart';
import 'package:stap_board/presentation/components/small_screens_msg.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/drawers/3d_shapes_drawer.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/drawers/background_image_drawer.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/drawers/shapes_drawer.dart';
import 'package:stap_board/presentation/components/tools_kit/tool_plugins/drawers/text_drawer.dart';
import 'package:stap_board/presentation/components/tools_kit/tools_kit.dart';
import 'package:stap_board/presentation/components/top_right_buttons.dart';
import 'package:story_painter/story_painter.dart';

class DrawingSpace extends StatefulWidget {
  const DrawingSpace({super.key});

  @override
  State<DrawingSpace> createState() => _DrawingSpaceState();
}

class _DrawingSpaceState extends State<DrawingSpace> {
  List listOfDrawers = <Widget>[
    const TextDrawer(),
    const ShapesDrawer(),
    const ThreeDShapesDrawer(),
    const BackgroundImageDrawer(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return (screenSizeWidth < 650)
        ? const SmallScreensMSG()
        : Scaffold(
            endDrawer: Consumer<DrawerIndex>(
                builder: (context, drawerIndex, child) =>
                    listOfDrawers[drawerIndex.drawerIndex]),
            backgroundColor: meta.colorPallet.grey100,
            body: Column(
              children: [
                const CustomTitleBar(),
                Expanded(
                  child: Stack(
                    children: [
                      Consumer<BackgroundImageSettings>(
                        builder: (context, backgroundImageSettings, child) {
                          return Container(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              decoration: backgroundImageSettings
                                      .backgroundImagePath.isEmpty
                                  ? null
                                  : BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            backgroundImageSettings
                                                .backgroundImagePath),
                                        fit: BoxFit.fill,
                                      ),
                                    ));
                        },
                      ),
                      Consumer<PaintSettings>(
                        builder: (context, paintSettings, child) {
                          return StoryPainter(
                            control: paintSettings.painterControl,
                          );
                        },
                      ),
                      Consumer<StickerSettings>(
                        builder: (context, stickerSettings, child) {
                          return LindiStickerWidget(
                              controller: stickerSettings.controller,
                              child: const SizedBox(
                                width: double.maxFinite,
                                height: double.maxFinite,
                              ));
                        },
                      ),
                      const TopRightButtons(),
                      const ToolsKit(),
                    ],
                  ),
                ),
              ],
            ));
  }
}
