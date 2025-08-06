import 'package:flutter/material.dart';

import '../color/skil_text_color.dart';

class DataUtils {
  static Color SkillColor({required String skilname}) {
    switch (skilname.toLowerCase()) {
      case 'nestjs':
        return NESTJS_COLOR;
      case 'flutter':
        return FLUTTER_COLOR;
      case 'c':
        return C_COLOR;
      case 'typescript':
        return TYPESCRIPT_COLOR;
      case 'javascript':
        return JAVASCRIPT_COLOR;
      case 'python':
        return PYTHON_COLOR;
      default:
        return Colors.black;
    }
  }
}
