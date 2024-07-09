import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stap_board/data/list_data_of_background_image_options.dart';
import 'package:stap_board/data/providers/background_image_settings.dart';

class BackgroundImageDrawer extends StatefulWidget {
  const BackgroundImageDrawer({super.key});

  @override
  State<BackgroundImageDrawer> createState() => _BackgroundImageDrawerState();
}

class _BackgroundImageDrawerState extends State<BackgroundImageDrawer> {
  int indexOfSubject = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Choose background image',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: listOfSubject.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      indexOfSubject = index;
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          listOfSubject[index],
                          style: TextStyle(
                              color: indexOfSubject == index
                                  ? Colors.purple
                                  : Colors.black),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Consumer<BackgroundImageSettings>(
            builder: (context, backgroundImageSettings, child) => SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataOfBackgroundImageOptions[indexOfSubject].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      backgroundImageSettings.changeBackground(
                          dataOfBackgroundImageOptions[indexOfSubject][index]
                              ['image_asset_url']);
                    },
                    leading: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pink[100],
                        image: (dataOfBackgroundImageOptions[indexOfSubject]
                                    [index]['image_asset_url'] !=
                                '')
                            ? DecorationImage(
                                image: AssetImage(
                                    dataOfBackgroundImageOptions[indexOfSubject]
                                        [index]['image_asset_url']),
                                fit: BoxFit.fill,
                              )
                            : null,
                      ),
                    ),
                    title: Text(dataOfBackgroundImageOptions[indexOfSubject]
                        [index]['title']),
                    subtitle: Text(dataOfBackgroundImageOptions[indexOfSubject]
                        [index]['subtitle']),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
