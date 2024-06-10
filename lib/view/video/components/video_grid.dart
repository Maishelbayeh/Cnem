import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoContainer extends StatefulWidget {
  VideoContainer({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.asset(
      'videos/cnem.mp4',
    ),
  );
  @override
  VideoContainerState createState() => VideoContainerState();
}

class VideoContainerState extends State<VideoContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.flickManager.dispose(); // Dispose the FlickManager
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final value = _controller.value;
          return Transform.translate(
            offset: Offset(0, 2 * value), // Move the container up and down
            child: Container(
              height: widget.height!,
              width: widget.width!,
              padding: const EdgeInsets.all(defaultPadding / 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ]),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.pink,
                    offset: Offset(-2, 0),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(2, 0),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FlickVideoPlayer(
                  flickManager: widget.flickManager,
                  flickVideoWithControls: const FlickVideoWithControls(
                    controls: FlickPortraitControls(), // Use portrait controls
                    videoFit: BoxFit.cover, // Set the fit of the video
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
