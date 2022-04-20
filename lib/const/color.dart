import 'package:flutter/material.dart';

class Warna {
  static const Color baseColor = Color.fromRGBO(30,34,53,1);
  static const Color bgColor = Color.fromRGBO(17,17,17,1);
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}