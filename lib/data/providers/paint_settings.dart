import 'package:flutter/material.dart';
import 'package:stap_board/app/meta.dart';
import 'package:story_painter/story_painter.dart';

class PaintSettings extends ChangeNotifier {
  StoryPainterControl painterControl = StoryPainterControl(
    type: PainterDrawType.arc,
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
    color: Colors.black,
    width: 5,
    onDrawStart: () {},
    onDrawEnd: () {},
  );

  void initialDrawing() {
    // painterControl.startPath(
    //   Offset(258.0, 257.0),
    // );
    notifyListeners();
  }

  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //  +                       PEN TOOLS METHODS.                        +
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  void pencil(Color currentColor) {
    painterControl.setWidth(5);
    painterControl.setColor(currentColor.withOpacity(1));
    _changeCurrentPenTool('pencil');
    notifyListeners();
  }

  void mediumPen(Color currentColor) {
    painterControl.setWidth(8);
    painterControl.setColor(currentColor.withOpacity(0.8));
    _changeCurrentPenTool('medium_pen');
    notifyListeners();
  }

  void thinPen(Color currentColor) {
    painterControl.setWidth(2);
    painterControl.setColor(currentColor.withOpacity(1));
    _changeCurrentPenTool('thin_pen');
    notifyListeners();
  }

  void marker(Color currentColor) {
    painterControl.setWidth(30);
    painterControl.setColor(currentColor.withOpacity(0.01));
    _changeCurrentPenTool('marker');
    notifyListeners();
  }

  String _currentPenToolVar = 'pencil';
  String _changeCurrentPenTool(String newPenTool) {
    _currentPenToolVar = newPenTool;
    notifyListeners();
    return _currentPenToolVar;
  }

  String currentPenTool() {
    return _currentPenToolVar;
  }

  void eraser() {
    painterControl.setWidth(12);
    painterControl.setColor(meta.colorPallet.grey100);
    notifyListeners();
  }

  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //  +                       OPERATIONS.                               +
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  void undo() {
    painterControl.undo();
    notifyListeners();
  }

  void redo() {
    notifyListeners();
  }

  void save() {
    // var image = painterControl.toImage(pixelRatio: 3.0);
    notifyListeners();
  }

  void changeColor(Color color, String penToolUsed) {
    if (penToolUsed == 'pencil') {
      painterControl.setWidth(5);
      painterControl.setColor(color.withOpacity(1));
    } else if (penToolUsed == 'medium_pen') {
      painterControl.setWidth(8);
      painterControl.setColor(color.withOpacity(0.8));
    } else if (penToolUsed == 'thin_pen') {
      painterControl.setWidth(2);
      painterControl.setColor(color.withOpacity(1));
    } else if (penToolUsed == 'marker') {
      painterControl.setWidth(30);
      painterControl.setColor(color.withOpacity(0.01));
    }
    _changeCurrentColor(color);
    notifyListeners();
  }

  Color _currentColorVar = Colors.black;
  Color _changeCurrentColor(Color newColor) {
    if (newColor != meta.colorPallet.grey100) {
      _currentColorVar = newColor;
    }
    notifyListeners();
    return _currentColorVar;
  }

  Color currentColor() {
    return _currentColorVar;
  }

  void clear() {
    int numberOfLinesDrawen = painterControl.lines.length;
    for (var i = 0; i < numberOfLinesDrawen; i++) {
      painterControl.undo();
    }
    notifyListeners();
  }
}
