import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final Color color;
  final Color borderColor;
  final Color fontColor;

  LevelButtonWidget(
      {required this.label,
      required this.color,
      required this.borderColor,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              color: fontColor, fontSize: 13),
        ),
      ),
    );
  }
}
