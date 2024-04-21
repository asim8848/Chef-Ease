import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UserVideo extends StatefulWidget {
  const UserVideo({super.key});

  @override
  State<UserVideo> createState() => _UserVideoState();
}

class _UserVideoState extends State<UserVideo> {
  final List<String> videoUrls = [
    'https://player.vimeo.com/external/541792503.sd.mp4?s=7d2fd0f22fc9dcf238e1794ee2ec80495825fc26&profile_id=165&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/469973144.sd.mp4?s=544d5c6c939c432eeb67ede13d1b343dc64ec6d5&profile_id=165&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/469970793.sd.mp4?s=9df916f7913d78ca535fe5ffcc55335391770865&profile_id=165&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/490788903.hd.mp4?s=e82376e0b5719d16f5b4f38cb9d7bde4dc1839c1&profile_id=174&oauth2_token_id=57447761',
    'https://player.vimeo.com/progressive_redirect/playback/691318213/rendition/540p?loc=external&oauth2_token_id=57447761&signature=0913fe752e7a0c195c7a38acdc5c3073d436334e6c8e41d2e89eddc85fd1c8a2',
    'https://player.vimeo.com/external/556347858.sd.mp4?s=7ff0c3a72765a7af5c8c74933bad881439771302&profile_id=165&oauth2_token_id=57447761'

    // Add more video URLs as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: GridView.builder(
          itemCount: videoUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return VideoItem(videoUrl: videoUrls[index]);
          },
        )
    );
  }
}
class VideoItem extends StatefulWidget {
  final String videoUrl;

  const VideoItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle video tap
        print('Video tapped!');
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3 - 3.0, // Adjust the width based on the screen width and grid spacing
            height: (MediaQuery.of(context).size.width / 3 - 3.0) * 16 / 9, // Set aspect ratio to 9:16
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: VideoPlayer(_controller),
            ),
          ),
          _controller.value.isInitialized
              ?  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.play_arrow_outlined,
                color: Colors.white,
                size: 22,
              ),
              SizedBox(width: 2),
              Text(
                '500', // Example view count
                style: TextStyle(color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ) : Container(),
        ],
      ),
    );
  }
}
