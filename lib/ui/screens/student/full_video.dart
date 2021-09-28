// import 'dart:async';
//
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../../bloc/model/video_model.dart';
// import '../../../helpers/screen_helper.dart';
// import '../../../utils/constants.dart';
// import '../../widgets/global/circle_icon.dart';
//
// class FullVideo extends StatefulWidget {
//   String videoUrl;
//   String imageUrl;
//   FullVideo({this.videoUrl,this.imageUrl});
//   @override
//   _FullVideoState createState() => _FullVideoState();
// }
//
// class _FullVideoState extends State<FullVideo> {
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
//
//
//   //
//   // @override
//   // void initState() {
//   //   _controller = VideoPlayerController.network(
//   //       'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
//   //   _initializeVideoPlayerFuture= _controller.initialize().then((value) {
//   //     setState(() {});
//   //   });
//   //   // _controller.setLooping(true);
//   //   super.initState();
//   //
//   // }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     maxSlider = 100.0;
//     icon = Icons.play_arrow;
//     iconColor = null;
//
//     _controller = VideoPlayerController.network(
//         'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         _initializeVideoPlayerFuture = _controller.initialize();
//         videoState = 0;
//         sliderStatus = 0;
//         setState(() {
//
//         });
//       });
//
//     _controller.addListener(() {
//       setState(() {
//         _playPackTime = _controller.value.position.inSeconds;
//         if (_playPackTime == _controller.value.duration.inSeconds) {
//           videoState = 1;
//           icon = Icons.play_arrow;
//           iconColor = null;
//         }
//       });
//     });
//     sliderStatus = 1;
//     timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
//       setState(() {
//         if (animateWidth > 300) {
//           animateWidth = 100;
//         } else {
//           animateWidth += 100;
//         }
//         if (animateHeight > 400) {
//           animateHeight = 100;
//         } else {
//           animateHeight += 100;
//         }
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();
//     timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           iconColor = null;
//           Timer(Duration(seconds: 5), () {
//             iconColor = Colors.transparent;
//           });
//         });
//       },
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Container(
//           width: double.infinity,
//           height: ScreenHelper.screenHeight(context, 442),
//           child: Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: ScreenHelper.screenHeight(context, 442),
//                 child: Image.network(
//                     widget.imageUrl??"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.newgrounds.com%2Fart%2Fview%2Ffunklikedahshoe%2Flook-at-the-eye&psig=AOvVaw0AwE6EJMAxxjosW44mL-5a&ust=1612875553472000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOi4reer2u4CFQAAAAAdAAAAABAI"
//                 ),
//               ),
//               Container(
//                 child: FutureBuilder(
//                   future: _initializeVideoPlayerFuture,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       return VideoPlayer(_controller);
//                     } else {
//                       // If the VideoPlayerController is still initializing, show a
//                       // loading spinner.
//                       return Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//               ),
//               Positioned(
//                 width: animateWidth,
//                 height: animateHeight,
//                 child: WavyAnimatedTextKit(
//                   textStyle: Theme.of(context).textTheme.headline3.copyWith(
//                       color: MAINCOLOR,
//                       fontSize: ScreenHelper.screenFont(context, 15)),
//                   text: [
//                     "5858925z",
//                   ],
//                   isRepeatingAnimation: true,
//                   speed: Duration(milliseconds: 200),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: ScreenHelper.screenWidth(context, 16),
//                   vertical: ScreenHelper.screenHeight(context, 16),
//                 ),
//                 child: Align(
//                     alignment: Alignment.topCenter,
//                     child: videoState != 3
//                         ? Row(
//                       textDirection: TextDirection.rtl,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CirlceIcon(
//                           icon: Icons.arrow_forward_rounded,
//                           onTap: () {
//                             Get.back();
//                           },
//                         ),
//                         SizedBox(
//                           width: 0,
//                         ),
// //                            CirlceIcon(
// //                              icon: Icons.surround_sound,
// //                            ),
//                       ],
//                     )
//                         : SizedBox(
//                       height: 0,
//                     )),
//               ),
//               Center(
//                   child:
// //                videoState != 3
// //                    ?
//                   CirlceIcon(
//                     buttonColor: iconColor,
//                     iconColor: iconColor,
//                     onTap: () {
//                       setState(() {
//                         // If the video is playing, pause it.
//                         if (_controller.value.isPlaying) {
//                           setState(() {
//                             _controller.pause();
//                             icon = Icons.play_arrow;
//                             iconColor = Colors.transparent;
//                             iconColor = null;
//                             videoState = 1;
//                           });
//                         } else {
//                          //If the video is paused, play it.
//                           setState(() {
//                             if (_playPackTime ==
//                                 _controller.value.duration.inSeconds) {
//                               _controller.seekTo(Duration(seconds: 0));
//                             }
//                             _controller.play();
//                             icon = Icons.pause;
//                             iconColor = Colors.transparent;
//                             videoState = 3;
//                           });
//                           // _controller.play();
//                         }
//                       });
//                     },
//                     icon: icon,
//                     size: 62,
//                   )
// //                    : SizedBox(
// //                        height: 0,
// //                      )
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: ScreenHelper.screenHeight(context, 300),
//                   ),
//                   SliderTheme(
//                     data: SliderThemeData(
//                       activeTickMarkColor: Colors.black,
//                       activeTrackColor: MAINCOLOR,
//                       inactiveTrackColor: Colors.grey.withOpacity(.3),
//                       thumbColor: MAINCOLOR,
//                       thumbShape: RoundSliderThumbShape(
//                           enabledThumbRadius:
//                           ScreenHelper.screenHeight(context, 10)),
//                     ),
//                     child: Slider(
//                       value: _playPackTime.toDouble(),
//                       onChanged: (value) {
//                         setState(() {
//                           _controller.seekTo(Duration(seconds: value.toInt()));
//                         });
//                         _playPackTime = value.toInt();
//                       },
//                       min: 0,
// //                      max: 100,
//                       max: _controller.value.duration != null
//                           ? _controller.value.duration.inSeconds.toDouble()
//                           : 100,
//                       autofocus: true,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }