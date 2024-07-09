import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/list_of_colors.dart';
import 'package:stap_board/data/providers/paint_settings.dart';

class ChooseColor extends StatefulWidget {
  final Function isFinished;
  const ChooseColor({super.key, required this.isFinished(bool? finished)});

  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: meta.colorPallet.pureWhite,
          borderRadius: BorderRadius.circular(10),
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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Choose color',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: listOfColors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<PaintSettings>(
                          builder: (context, paintSettings, child) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              widget.isFinished(true);
                            });

                            paintSettings.changeColor(listOfColors[index][0],
                                paintSettings.currentPenTool());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: listOfColors[index][0],
                                    border: paintSettings.currentColor() ==
                                            listOfColors[index][0]
                                        ? Border.all(
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            width: 3,
                                            color: listOfColors[index][0])
                                        : null),
                              ),
                              const SizedBox(height: 5),
                              Text(listOfColors[index][1]),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
