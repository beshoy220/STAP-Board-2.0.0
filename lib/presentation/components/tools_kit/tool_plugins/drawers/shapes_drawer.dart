import 'package:flutter/material.dart';

class ShapesDrawer extends StatefulWidget {
  const ShapesDrawer({super.key});

  @override
  State<ShapesDrawer> createState() => _ShapesDrawerState();
}

class _ShapesDrawerState extends State<ShapesDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 3,
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Choose shape',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text('Can be used out of demo mode.')
        ],
      ),
    );
  }
}
