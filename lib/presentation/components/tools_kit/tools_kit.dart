import 'package:flutter/material.dart';
import 'package:stap_board/presentation/components/tools_kit/horizontal_tools.dart';
import 'package:stap_board/presentation/components/tools_kit/vertical_tools.dart';

class ToolsKit extends StatefulWidget {
  // final Function(bool) isMiniView;

  const ToolsKit({
    super.key,
    // required this.isMiniView
  });

  @override
  State<ToolsKit> createState() => _ToolsKitState();
}

class _ToolsKitState extends State<ToolsKit> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: HorizontalTools()),
        Expanded(flex: 7, child: VerticalTools())
      ],
    );
  }
}

//

