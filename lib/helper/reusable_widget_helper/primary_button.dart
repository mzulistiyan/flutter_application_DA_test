import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';

import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  String? text;
  final Function()? onPressed;

  PrimaryButton({
    super.key,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ColorHelper.primaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text!,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
