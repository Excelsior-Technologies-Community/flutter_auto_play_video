import 'package:flutter/material.dart';

class LongTextSpacer extends StatelessWidget {
  const LongTextSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: List.generate(
          6,
              (i) => const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "🔥 Scroll down to hide the video and see if it pauses automatically.",
              style: TextStyle(fontSize: 18, height: 1.6),
            ),
          ),
        ),
      ),
    );
  }
}
