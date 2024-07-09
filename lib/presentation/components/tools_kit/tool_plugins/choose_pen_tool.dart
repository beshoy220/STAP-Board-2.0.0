import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/providers/paint_settings.dart';

class ChoosePenTool extends StatefulWidget {
  final Function isFinished;
  const ChoosePenTool({super.key, required this.isFinished(bool? finished)});

  @override
  State<ChoosePenTool> createState() => _ChoosePenToolState();
}

class _ChoosePenToolState extends State<ChoosePenTool> {
  List listOfPenTools = [
    ['pencil.png', 'Pencil'],
    ['thin_pen.png', 'Thin pen'],
    ['medium_pen.png', 'Medium pen'],
    ['marker.png', 'Marker']
  ];
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
                  'Choose pen tool',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: listOfPenTools.length,
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
                            switch (index) {
                              case 0:
                                paintSettings
                                    .pencil(paintSettings.currentColor());
                                break;
                              case 1:
                                paintSettings
                                    .thinPen(paintSettings.currentColor());
                                break;
                              case 2:
                                paintSettings
                                    .mediumPen(paintSettings.currentColor());
                                break;
                              case 3:
                                paintSettings
                                    .marker(paintSettings.currentColor());
                                break;
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/${listOfPenTools[index][0]}'),
                                        fit: BoxFit.fitWidth)),
                              ),
                              Text(
                                listOfPenTools[index][1],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
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
