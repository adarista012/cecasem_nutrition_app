import 'package:flutter/material.dart';

Widget labelBold(String str, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      str,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
  );
}
