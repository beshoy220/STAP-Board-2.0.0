import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/presentation/components/small_screens_msg.dart';

class SchoolHub extends StatefulWidget {
  const SchoolHub({super.key});

  @override
  State<SchoolHub> createState() => _SchoolHubState();
}

class _SchoolHubState extends State<SchoolHub> {
  bool isFullscreen = false;

  int indexOfTopBar = 0;
  List localListOfTopBar = [
    'Current class',
    'School hub',
  ];

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return (screenSizeWidth < 650)
        ? const SmallScreensMSG()
        : Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: const Color(0xFF710099),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_sharp,
                                            color: Colors.white,
                                            size: 28,
                                          )),
                                      const SizedBox(width: 10),
                                      Text(
                                        meta.appName,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 28),
                                      )
                                    ],
                                  ),
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
                                          if (isFullscreen) {
                                            html.document.exitFullscreen();
                                            setState(() {
                                              isFullscreen = false;
                                            });
                                          } else {
                                            html.document.documentElement!
                                                .requestFullscreen();
                                            setState(() {
                                              isFullscreen = true;
                                            });
                                          }
                                        },
                                        icon: Icon(isFullscreen
                                            ? Icons.fullscreen_exit
                                            : Icons.fullscreen_rounded)),
                                  ),
                                ]),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          color: const Color(0xFFF4F4F4),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(120, 150, 120, 0),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const SizedBox(height: 60),
                                  Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        const Text('Sun rise language school',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text('Grade 8 - Class C',
                                            style: TextStyle(
                                                color: Colors.grey[800]))
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(18),
                                    child: Text(
                                        '1.Currently you can only view old boards but we are studing adding edit feature to it where you can edit old boards. \n\n2.School hub is under developing right now. School hub is a section where you can view all school boards\' saved drawings.\n\n3.We are figuring out new exclusive featues like dark mode and colored board backgrounds.\n\n\nPowered by Ravens '),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.maxFinite,
                                        height: 60,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: localListOfTopBar.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  indexOfTopBar = index;
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      localListOfTopBar[index],
                                                      style: TextStyle(
                                                          color:
                                                              indexOfTopBar ==
                                                                      index
                                                                  ? Colors
                                                                      .purple
                                                                  : Colors
                                                                      .black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      (indexOfTopBar == 0)
                                          ? GridView.builder(
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: 2,
                                                crossAxisCount: 4,
                                              ),
                                              itemCount: 7,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: SingleChildScrollView(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.maxFinite,
                                                          height: 120,
                                                          color: Colors.grey,
                                                        ),
                                                        Text('data')
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : const Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 50),
                                                child: Text(
                                                    'School hub is under developing right now.\nThanks for your understanding :)'),
                                              ),
                                            )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
