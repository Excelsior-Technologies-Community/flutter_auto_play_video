import 'package:flutter/material.dart';
import 'package:flutter_auto_play_video/autoplay_videos/autoplay_video.dart';
import 'package:flutter_auto_play_video/utils/logger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const AutoplayVideo(
              path: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
            ),
            LongTextSpacer(),
            const SizedBox(height: 20),
            const AutoplayVideo(path: 'assets/videos/demo.mp4',isAsset: true,),
            const SizedBox(height: 500,)
          ],
        ),
      ),
    );
  }
}
