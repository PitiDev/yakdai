import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color(0xFF66a6ff);
  static const Color loginGradientEnd = const Color(0xFF89f7fe);

  static const Color loginBtnStart = const Color(0xFF1565c0);
  static const Color loginBtnEnd = const Color(0xFF66a6ff);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
