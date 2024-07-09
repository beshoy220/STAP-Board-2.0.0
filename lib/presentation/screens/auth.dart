import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stap_board/app/meta.dart';
import 'package:stap_board/data/grade_class_list.dart';
import 'package:stap_board/presentation/components/desktop_buttons.dart';
import 'package:stap_board/presentation/components/small_screens_msg.dart';
import 'package:stap_board/presentation/screens/drawing_space.dart';

class AuthScrren extends StatefulWidget {
  const AuthScrren({super.key});

  @override
  State<AuthScrren> createState() => _AuthScrrenState();
}

class _AuthScrrenState extends State<AuthScrren> {
  bool _autoPlay = true;
  String _grade = grade[0];
  String _classs = classs[0];
  int choosenSchoolIndex = 1;
  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return (screenSizeWidth < 650)
        ? const SmallScreensMSG()
        : Scaffold(
            backgroundColor: meta.colorPallet.primary700,
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/bg2.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        color: meta.colorPallet.pureWhite,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                ' ${meta.fullAppName.split(' ').first} ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        TextSpan(
                                          text:
                                              meta.fullAppName.split(' ').last,
                                          style: const TextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(flex: 1, child: Center()),
                                      Expanded(
                                        flex: 3,
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w300,
                                              color: meta.colorPallet.pureWhite,
                                            ),
                                            children: const <TextSpan>[
                                              TextSpan(
                                                  text: 'Connect ',
                                                  style: TextStyle()),
                                              TextSpan(
                                                text: 'STAP ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                  text: 'Board to your ',
                                                  style: TextStyle()),
                                              TextSpan(
                                                  text: 'STAP ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              TextSpan(
                                                  text:
                                                      'system by filling data below and wait until the admins accept your board.',
                                                  style: TextStyle()),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Expanded(flex: 1, child: Center()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              height: 400,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      choosenSchoolIndex = index;
                                      if (reason.name == 'manual') {
                                        _autoPlay = false;
                                      }
                                    });
                                  },
                                  pageSnapping: false,
                                  initialPage: 1,
                                  height: 350,
                                  enlargeFactor: 0.3,
                                  autoPlayCurve: Curves.easeIn,
                                  enableInfiniteScroll: false,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: _autoPlay,
                                  enlargeCenterPage: true,
                                ),
                                items: [1, 2, 3, 4, 5].map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 230,
                                              width: 230,
                                              decoration: BoxDecoration(
                                                  color:
                                                      meta.colorPallet.grey100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sun rise School (language)',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: meta.colorPallet
                                                          .pureWhite),
                                                ),
                                                Text(
                                                  '7th street El dokii - Cairo - Egypt',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: meta
                                                          .colorPallet.grey200),
                                                ),
                                                Text(
                                                  'School number: $i',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: meta
                                                          .colorPallet.grey200),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: meta.colorPallet.primary100,
                                      ),
                                      child: DropdownButton<String>(
                                        dropdownColor:
                                            meta.colorPallet.primary700,
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                        style: TextStyle(
                                            color: meta.colorPallet.pureWhite,
                                            fontWeight: FontWeight.w500),
                                        underline: const Center(),
                                        icon: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                              Icons.arrow_drop_down_rounded),
                                        ),
                                        value: _grade,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _grade = newValue!;
                                          });
                                        },
                                        items: grade
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(value),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 300,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: meta.colorPallet.primary100,
                                      ),
                                      child: DropdownButton<String>(
                                        dropdownColor:
                                            meta.colorPallet.primary700,
                                        borderRadius: BorderRadius.circular(10),
                                        isExpanded: true,
                                        style: TextStyle(
                                            color: meta.colorPallet.pureWhite,
                                            fontWeight: FontWeight.w500),
                                        underline: const Center(),
                                        icon: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                              Icons.arrow_drop_down_rounded),
                                        ),
                                        value: _classs,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _classs = newValue!;
                                          });
                                        },
                                        items: classs
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(value),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 615,
                              height: 45,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            meta.colorPallet.primary100),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    debugPrint({
                                      'school_index': choosenSchoolIndex,
                                      'grade': _grade,
                                      'class': _classs
                                    }.toString());
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const DrawingSpace(),
                                    ));
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: meta.colorPallet.pureWhite),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text(
                              'Version ${meta.appVersion}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: meta.colorPallet.pureWhite),
                            ),
                            Text(
                              meta.appSlogan,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: meta.colorPallet.pureWhite),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const CustomTitleBar(),
              ],
            ),
          );
  }
}
