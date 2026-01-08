# 🎬 Auto Play Video
Autoplay video library for Flutter —
**Instagram Reels / TikTok style auto play**
with visibility detection, fade + scale animations, tap pause/play,
and network + asset support. 🚀

---

## ✨ Features
✔ Auto play when video becomes visible   
✔ Auto pause when off-screen   
✔ Tap to pause / tap to play   
✔ Smooth fade + scale animation   
✔ Supports network & asset videos   
✔ Multiple videos inside ListView/GridView   
✔ Lightweight — no Chewie / no heavy player

---

## 📹 Demo GIF
![auto play video](https://github.com/user-attachments/assets/90a658dc-ed08-4772-bfb7-29ae3e0a3de7)


---

## 📦 Installation
### Add in your `pubspec.yaml`:
```yaml
dependencies:
  auto_play_video:
    path: '.../flutter_auto_play_video/auto_play_video'
```

### Using GitHub (Recommended during development) :
```yaml
dependencies:
  auto_play_video:
    git:
      url: https://github.com/your-username/flutter_auto_play_video.git
```

---

## 🚀 Usage
### 🔥 Network video auto-play
```dart
import 'package:auto_play_video/auto_play_video.dart';

AutoplayVideo(
  path: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
)
```

### 📁 Asset video auto-play
Add video to `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/videos/demo.mp4
```

Use:
```dart
AutoplayVideo(
  path: "assets/videos/demo.mp4",
  isAsset: true,
)
```
---

## 🧪 Full Example
```dart
import 'package:flutter/material.dart';
import 'package:auto_play_video/auto_play_video.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AutoPlay Video Demo')),
        body: ListView(
          children: const [
            AutoplayVideo(
              path: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
            ),
            SizedBox(height: 300),
            AutoplayVideo(
              path: "assets/videos/demo.mp4",
              isAsset: true,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## ⚙️ API
| Property                      | Type     | Required            | Description                  |
| ----------------------------- | -------- | ------------------- | ---------------------------- |
| `path`                        | `String` | ✓                   | Video URL or asset path      |
| `isAsset`                     | `bool`   | ✗ (default `false`) | Set true if file from assets |

---

## 🎯 How it works
🕵 VisibilityDetector tracks when video enters viewport   
🎬 Automatically starts playback   
👀 If video scrolls out (less than 60% visible) → auto pause   
👉 Tap toggles pause/play   
✨ Fade + Scale brings modern reel feel

---

## 📝 License
```text
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

