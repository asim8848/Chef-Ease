import 'dart:async';
import 'dart:io';
import 'package:chefease/api/reel_api.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../../chef/profile/ChefProfileScreen.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  _ReelsState createState() => _ReelsState();
}

class _ReelsState extends State<Reels> with SingleTickerProviderStateMixin {
  VideoPlayerController? _controller;
  bool _isPaused = false;
  bool _isLoading = true;
  double _progress = 0.0;
  late Timer _progressTimer;
  String? _currentReelUrl;
  final reelApi = ReelApi();
  late Future<List<dynamic>> _reels;

  @override
  void initState() {
    super.initState();
    _progressTimer = Timer(Duration.zero, () {});
    _reels = _fetchReels();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _progressTimer.cancel();
    super.dispose();
  }

  Future<List<dynamic>> _fetchReels() async {
    return await reelApi.getAllReels();
  }

  void _initializeVideoController(String reelUrl) async {
    _currentReelUrl = reelUrl;
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(reelUrl));
    if (response.statusCode == 200) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/tempVideo.mp4');
      await file.writeAsBytes(response.bodyBytes);

      _controller?.dispose();
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              _isLoading = false;
              _controller!.play();
            });
          }
        })
        ..setLooping(false)
        ..addListener(() {
          if (mounted) {
            setState(() {
              if (_controller!.value.duration.inMilliseconds != 0) {
                _progress = _controller!.value.position.inMilliseconds /
                    _controller!.value.duration.inMilliseconds;
              } else {
                _progress = 0.0;
              }
              _isPaused = !_controller!.value.isPlaying;
            });
          }
        });

      _progressTimer?.cancel();
      _progressTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
        if (mounted) {
          setState(() {
            _progress = (_controller!.value.position.inMilliseconds ?? 0) /
                (_controller!.value.duration.inMilliseconds ?? 1);
          });
        }
      });
    } else {
      print('Failed to load video: ${response.statusCode}');
    }
  }

  void _togglePause() {
    if (_controller != null) {
      setState(() {
        if (_controller!.value.isPlaying) {
          _controller!.pause();
          _isPaused = true;
        } else {
          _controller!.play();
          _isPaused = false;
        }
      });
    }
  }

  Widget _buildVideoPlayer(double width) {
    if (_controller != null && _controller!.value.isInitialized) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(_controller!),
          Container(
            width: width * _progress,
            height: 4,
            color: Color(0xFFFF6A42),
          ),
        ],
      );
    } else if (_isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[300],
        ),
      );
    } else {
      return Container(color: Colors.blueAccent);
    }
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
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('No reels available'));
          } else {
            final reels = snapshot.data!;
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: reels.length,
              onPageChanged: (index) {
                final reel = reels[index];
                _initializeVideoController(reel['ReelURL']);
              },
              itemBuilder: (context, index) {
                final reel = reels[index];

                return GestureDetector(
                  onTap: _togglePause,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(color: Color(0x5E1E1E1E)),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: _buildVideoPlayer(width),
                          ),
                        ),
                      ),
                      // Add additional UI components like user profile, action buttons, etc.
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
