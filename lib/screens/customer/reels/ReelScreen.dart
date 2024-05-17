import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../chef/profile/ChefProfileScreen.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Reels> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _isPaused = false;
  double _progress = 0.0;
  late Timer _progressTimer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  }

  void _initializeVideoController() async {
    _controller = VideoPlayerController.asset("assets/videos/sample_video.mp4");
    await _controller.initialize();
    setState(() {});
    _controller.play(); // Autoplay the video when initialized
    _controller.addListener(() {
      setState(() {
        _progress = _controller.value.position.inMilliseconds /
            _controller.value.duration.inMilliseconds;
        if (_controller.value.position == _controller.value.duration) {
          // Video is finished
          _isPaused = true;
        }
      });
    });

    // Start a timer to update the progress bar
    _progressTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        _progress = _controller.value.position.inMilliseconds /
            _controller.value.duration.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _progressTimer.cancel(); // Cancel the timer to prevent memory leaks
    _animationController.dispose();
  }

  void _togglePause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPaused = true;
      } else {
        _controller.play();
        _isPaused = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);

    List<Widget> reel = [
      GestureDetector(
        onTap: _togglePause,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: MediaQuery.of(context).size.width + 10,
                height: MediaQuery.of(context).size.height,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _controller.value.isInitialized
                          ? VideoPlayer(_controller)
                          : Container(
                              color: Colors.blueAccent,
                            ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: MediaQuery.of(context).size.width * _progress,
                        height: 4,
                        color: Color(0xFFFF6A42),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Color(0x5E1E1E1E)),
              ),
            ),

            Positioned(
              left: 31,
              top: MediaQuery.of(context).size.height * 0.650,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChefProfileScreen()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.241,
                  height: MediaQuery.of(context).size.width * 0.241,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/reels_pic.jpg"),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.048,
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: MediaQuery.of(context).size.width * 0.038,
                        offset: Offset(
                            0, MediaQuery.of(context).size.width * 0.008),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: MediaQuery.of(context).size.height * 0.760,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  'Julia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.091,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.225,
              top: MediaQuery.of(context).size.height * 0.775,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  '21',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.061,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.002,
              top: MediaQuery.of(context).size.height * 0.840,
              child: SizedBox(
                width: 200,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.060,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'USA, Florida',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.042,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//
            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.650,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for favorite button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.730,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for comment button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white, // Adjust the color as needed
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.810,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for share button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
            ),

            // Pause Button in the center
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible:
                    _isPaused, // Show the button only when the video is paused
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: _togglePause,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: MediaQuery.of(context).size.width + 10,
                height: MediaQuery.of(context).size.height,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _controller.value.isInitialized
                          ? VideoPlayer(_controller)
                          : Container(
                              color: Colors.blueAccent,
                            ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: MediaQuery.of(context).size.width * _progress,
                        height: 4,
                        color: Color(0xFFFF6A42),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Color(0x5E1E1E1E)),
              ),
            ),

            Positioned(
              left: 31,
              top: MediaQuery.of(context).size.height * 0.650,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.241,
                height: MediaQuery.of(context).size.width * 0.241,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imgs/reels_pic.jpg"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.048,
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: MediaQuery.of(context).size.width * 0.038,
                      offset:
                          Offset(0, MediaQuery.of(context).size.width * 0.008),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: MediaQuery.of(context).size.height * 0.760,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  'Julia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.091,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.225,
              top: MediaQuery.of(context).size.height * 0.775,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  '21',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.061,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.002,
              top: MediaQuery.of(context).size.height * 0.840,
              child: SizedBox(
                width: 200,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.060,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'USA, Florida',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.042,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//
            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.650,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for favorite button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.730,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for comment button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white, // Adjust the color as needed
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.810,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for share button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
            ),

            // Pause Button in the center
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible:
                    _isPaused, // Show the button only when the video is paused
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: _togglePause,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: MediaQuery.of(context).size.width + 10,
                height: MediaQuery.of(context).size.height,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      _controller.value.isInitialized
                          ? VideoPlayer(_controller)
                          : Container(
                              color: Colors.blueAccent,
                            ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: MediaQuery.of(context).size.width * _progress,
                        height: 4,
                        color: Color(0xFFFF6A42),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Color(0x5E1E1E1E)),
              ),
            ),

            Positioned(
              left: 31,
              top: MediaQuery.of(context).size.height * 0.650,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.241,
                height: MediaQuery.of(context).size.width * 0.241,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imgs/reels_pic.jpg"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.048,
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: MediaQuery.of(context).size.width * 0.038,
                      offset:
                          Offset(0, MediaQuery.of(context).size.width * 0.008),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: MediaQuery.of(context).size.height * 0.760,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  'Julia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.091,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.225,
              top: MediaQuery.of(context).size.height * 0.775,
              child: SizedBox(
                width: 100,
                height: 50,
                child: Text(
                  '21',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.061,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.002,
              top: MediaQuery.of(context).size.height * 0.840,
              child: SizedBox(
                width: 200,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.060,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'USA, Florida',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.042,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//
            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.650,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for favorite button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.730,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for comment button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.mode_comment_outlined,
                      size: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white, // Adjust the color as needed
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.794,
              top: MediaQuery.of(context).size.height * 0.810,
              child: GestureDetector(
                onTap: () {
                  // Add functionality for share button here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.134,
                  height: MediaQuery.of(context).size.width * 0.134,
                  decoration: BoxDecoration(
                    color: Colors.grey[900], // Dark background color
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.026,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2), // Shadow position, from top-left
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                  ),
                ),
              ),
            ),

            // Pause Button in the center
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible:
                    _isPaused, // Show the button only when the video is paused
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: reel,
          controller: controller,
        ),
      ),
    );
  }
}
