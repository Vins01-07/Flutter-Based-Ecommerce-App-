import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00FFCC), Color(0xFF6366F1)],
          ).createShader(bounds),
          child: Text(
            "SHOPVIBE",
            style: GoogleFonts.outfit(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: Colors.white54,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(
          widget.image!,
          height: 265,
          width: 235,
        ),
      ],
    );
  }
}

