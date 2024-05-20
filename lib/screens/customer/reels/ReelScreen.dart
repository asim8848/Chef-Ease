import 'dart:async';
import 'package:chefease/api/reel_api.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../chef/profile/ChefProfileScreen.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  _ReelsState createState() => _ReelsState();
}

class _ReelsState extends State<Reels> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _isPaused = false;
  double _progress = 0.0;
  late Timer _progressTimer;
  final reelApi = ReelApi(); // Create an instance of the ReelApi class
  late Future<List<dynamic>> _reels;

  @override
  void initState() {
    super.initState();
    _reels = _fetchReels();
  }

  Future<List<dynamic>> _fetchReels() async {
    return await reelApi.getAllReels();
  }

  void _initializeVideoController(String reelUrl) async {
    _controller = VideoPlayerController.network(reelUrl);
    await _controller.initialize();
    _controller.play();
    _controller.addListener(() {
      setState(() {
        if (_controller.value.duration.inMilliseconds != 0) {
          _progress = _controller.value.position.inMilliseconds /
              _controller.value.duration.inMilliseconds;
        } else {
          _progress = 0.0;
        }
        _isPaused = true;
      });
    });

    _progressTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        if (_controller.value.duration.inMilliseconds != 0) {
          _progress = _controller.value.position.inMilliseconds /
              _controller.value.duration.inMilliseconds;
        } else {
          _progress = 0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _progressTimer.cancel();
    super.dispose();
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

  Widget _buildVideoPlayer(double width) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : Container(color: Colors.blueAccent),
        Container(
          width: width * _progress,
          height: 4,
          color: Color(0xFFFF6A42),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, double size, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(size * 0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, color: Colors.white, size: size * 0.45),
        ),
      ),
    );
  }

  Widget _buildUserProfile(double width, double height) {
    return Positioned(
      left: 31,
      top: height * 0.65,
      child: InkWell(
        onTap: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChefProfileScreen(),
            ),
          );*/
        },
        child: Container(
          width: width * 0.24,
          height: width * 0.24,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/reels_pic.jpg"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.05),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: width * 0.04,
                offset: Offset(0, width * 0.008),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(double width, double height) {
    return Stack(
      children: [
        Positioned(
          left: 31,
          top: height * 0.76,
          child: Text(
            'Julia',
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.09,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          left: width * 0.225,
          top: height * 0.775,
          child: Text(
            '21',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.06,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Positioned(
          left: width * 0.002,
          top: height * 0.84,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: width * 0.06,
              ),
              SizedBox(width: 4),
              Text(
                'USA, Florida',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.04,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _reels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final reels = snapshot.data!;
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: reels.length,
              itemBuilder: (context, index) {
                final reel = reels[index];
                _initializeVideoController(reel['ReelURL']);
                return GestureDetector(
                  onTap: _togglePause,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          width: width + 10,
                          height: height,
                          decoration: BoxDecoration(color: Color(0x5E1E1E1E)),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: _buildVideoPlayer(width),
                          ),
                        ),
                      ),
                      _buildUserProfile(width, height),
                      _buildUserInfo(width, height),
                      Positioned(
                        left: width * 0.794,
                        top: height * 0.65,
                        child: _buildActionButton(
                            Icons.favorite_border_outlined, width * 0.13),
                      ),
                      Positioned(
                        left: width * 0.794,
                        top: height * 0.73,
                        child: _buildActionButton(
                            Icons.mode_comment_outlined, width * 0.13),
                      ),
                      Positioned(
                        left: width * 0.794,
                        top: height * 0.81,
                        child: _buildActionButton(Icons.share, width * 0.13),
                      ),
                      if (_isPaused)
                        Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
