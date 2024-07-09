import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/data/providers/sticker_settings.dart';
import 'package:stap_board/logic/color_to_name.dart';

class TextDrawer extends StatefulWidget {
  const TextDrawer({super.key});

  @override
  State<TextDrawer> createState() => _TextDrawerState();
}

class _TextDrawerState extends State<TextDrawer> {
  TextEditingController controller = TextEditingController();

  List<FontWeight> fontWeight = [
    FontWeight.w100,
    FontWeight.w300,
    FontWeight.w900,
  ];
  String fontWeightLabel = '300';
  int choosenFontWeightIndex = 1;
  int sliderValueForFontSize = 24;
  Color choosenColor = Colors.black;
  List colors = [
    Colors.black,
    Colors.grey,
    Colors.red[900],
    Colors.green[900],
    Colors.blue[900],
    Colors.yellow[700],
    Colors.pink[900],
    Colors.brown,
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 3,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Edit text',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                maxLines: 6,
                maxLength: 2000,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Font Weght : $fontWeightLabel',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: fontWeight.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: choosenFontWeightIndex == index
                                ? Colors.purple[100]
                                : null,
                          ),
                          onPressed: () {
                            setState(() {
                              fontWeightLabel =
                                  fontWeight[index].value.toString();
                              choosenFontWeightIndex = index;
                            });
                          },
                          child: Text(
                            'Text',
                            style: TextStyle(
                                fontWeight: fontWeight[index],
                                color: choosenFontWeightIndex == index
                                    ? Colors.black
                                    : null),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Font size : $sliderValueForFontSize',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Slider(
                  value: sliderValueForFontSize.toDouble(),
                  min: 0,
                  max: 100,
                  onChanged: (newValue) {
                    setState(() {
                      sliderValueForFontSize = newValue.toInt();
                    });
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Font color : ${colorToName(choosenColor)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: colors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              choosenColor = colors[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors[index],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Consumer<StickerSettings>(
                builder: (context, stickerSettings, child) => OutlinedButton(
                    onPressed: () {
                      controller.text.isNotEmpty
                          ? stickerSettings.addSticker(Text(
                              controller.text,
                              style: TextStyle(
                                  fontWeight:
                                      fontWeight[choosenFontWeightIndex],
                                  color: choosenColor,
                                  fontSize: sliderValueForFontSize.toDouble()),
                            ))
                          : null;
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add text')))
          ],
        ),
      ),
    );
  }
}
