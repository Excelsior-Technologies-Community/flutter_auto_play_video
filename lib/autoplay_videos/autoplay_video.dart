import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AutoplayVideo extends StatefulWidget {
  final String path;
  final bool isAsset;

  const AutoplayVideo({
    super.key,
    required this.path,
    this.isAsset = false,
  });

  @override
  State<AutoplayVideo> createState() => _AutoplayVideoState();
}

class _AutoplayVideoState extends State<AutoplayVideo>
    with TickerProviderStateMixin {
  VideoPlayerController? _controller;
  bool _buffering = true;
  bool _pausedByUser = false;

  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    // Scale animation (TikTok feel)
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      lowerBound: 0.92,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    );

    _initController();
  }

  void _initController() async {
    if (widget.isAsset) {
      _controller = VideoPlayerController.asset(
        widget.path,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
    } else {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.path),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
    }

    await _controller!.initialize();
    await _controller!.setLooping(true);

    setState(() {});

    _controller!.addListener(() {
      setState(() {
        _buffering = _controller!.value.isBuffering;
      });
    });
  }

  void _play() {
    if (!_pausedByUser && !_controller!.value.isPlaying) {
      _controller!.play();
      _fadeController.forward();
      _scaleController.forward();
    }
  }

  void _pause() {
    if (_controller!.value.isPlaying) {
      _controller!.pause();
      _fadeController.reverse();
      _scaleController.reverse();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.path),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.6) {
          if (!_pausedByUser) _play();
        } else {
          _pause();
        }
      },
      child: _controller == null || !_controller!.value.isInitialized
          ? const SizedBox(
        height: 220,
        child: Center(child: CircularProgressIndicator()),
      )
          : GestureDetector(
        onTap: () {
          if (_controller!.value.isPlaying) {
            _pausedByUser = true;
            _pause();
          } else {
            _pausedByUser = false;
            _play();
          }
          setState(() {});
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),

            if (!_controller!.value.isPlaying && !_buffering)
              const Icon(Icons.play_circle_fill,
                  size: 60, color: Colors.white70),

            if (_buffering)
              const Positioned(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
