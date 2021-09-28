// import 'dart:async';
//
// import 'package:azcourses/helpers/screen_helper.dart';
// import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';
//
//
// class UseTestScreen extends StatefulWidget {
//   @override
//   _UseTestScreenState createState() => _UseTestScreenState();
// }
//
// class _UseTestScreenState extends State<UseTestScreen> {
//   IconData icon;
//   Color iconColor;
//   double sliderValue = 0;
//   double maxSlider;
//   double animateHeight = 100;
//   double animateWidth = 100;
//   Timer timer;
//   int videoState;  // 0 for initate 1 for puse 2 for last 3 for play
//
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;
//   int _playPackTime = 0;
//   int sliderStatus = 0;
//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(
//         'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
//     _initializeVideoPlayerFuture= _controller.initialize().then((value) {
//       setState(() {
//
//       });
//     });
//     // _controller.setLooping(true);
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Container(
//                 height: ScreenHelper.screenHeight(context,442),
//                 child: VideoPlayer(_controller));
//           } else {
//             // If the VideoPlayerController is still initializing, show a
//             // loading spinner.
//             return Center(child: Text("loading .. ",style: TextStyle(color: Colors.amberAccent),));
//           }
//         },
//       ),
//     );
//   }
// }
