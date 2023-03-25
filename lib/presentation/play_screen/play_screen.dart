import 'package:WhaleTunes/services/pageManager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

class PlayScreen extends StatelessWidget {
  String URL = '';

  PlayScreen({required this.URL, super.key});

  @override
  Widget build(BuildContext context) {
    print(URL);
    final PageManager _pageManager = PageManager(URL);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black900,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: AppDecoration.fillBluegray100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath:
                              ImageConstant.imgPexelseliannedipp4666750524x375,
                          height: size.height * 0.75,
                          width: size.width)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height / 3,
                  padding: getPadding(all: 22),
                  decoration: AppDecoration.fillGray900.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL40),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                height: getVerticalSize(40),
                                width: getHorizontalSize(24),
                                onTap: () {
                                  _pageManager.pause();
                                  onTapImgArrowleft(context);
                                },
                                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              ),
                              Text("Humpback Whale",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  textScaleFactor: 1.5,
                                  style:
                                      AppStyle.txtPlusJakartaSansRomanBold24),
                            ],
                          ),
                          Text("Audio captured on July 12th, 2022",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.5,
                              style: AppStyle
                                  .txtPlusJakartaSansRomanRegular10WhiteA700),
                        ],
                      ),
                      Spacer(),
                      ValueListenableBuilder<ButtonState>(
                        valueListenable: _pageManager.buttonNotifier,
                        builder: (_, value, __) {
                          switch (value) {
                            case ButtonState.loading:
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                width: 64.0,
                                height: 64.0,
                                child: const CircularProgressIndicator(),
                              );
                            case ButtonState.paused:
                              return IconButton(
                                onPressed: _pageManager.play,
                                icon: Icon(Icons.play_arrow_rounded),
                                iconSize: 64.0,
                                color: Colors.white,
                              );
                            case ButtonState.playing:
                              return IconButton(
                                onPressed: _pageManager.pause,
                                icon: Icon(Icons.pause_rounded),
                                iconSize: 64.0,
                                color: Colors.white,
                              );
                          }
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: _pageManager.progressNotifier,
                        builder: (_, value, __) {
                          return ProgressBar(
                            progress: value.current,
                            buffered: value.buffered,
                            total: value.total,
                            onSeek: _pageManager.seek,
                            progressBarColor: Colors.white,
                            baseBarColor: Colors.white.withOpacity(0.24),
                            bufferedBarColor: Colors.white.withOpacity(0.24),
                            thumbColor: Colors.white,
                          );
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // children: [
                  //   Padding(
                  //     padding: getPadding(left: 9),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: getPadding(top: 4),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   CustomImageView(
                  //                     svgPath: ImageConstant.imgArrowleft,
                  //                     height: getVerticalSize(40),
                  //                     width: getHorizontalSize(24),
                  //                     onTap: () {
                  //                       onTapImgArrowleft(context);
                  //                     },
                  //                   ),
                  //                   Padding(
                  //                     padding: getPadding(
                  //                         left: 29, top: 4, bottom: 4),
                  //                     child: Text("Humpback Whale",
                  //                         overflow: TextOverflow.ellipsis,
                  //                         textAlign: TextAlign.left,
                  //                         style: AppStyle
                  //                             .txtPlusJakartaSansRomanBold24),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Padding(
                  //                 padding: getPadding(right: 25),
                  //                 child: Text(
                  //                     "Audio captured on July 12th, 2022",
                  //                     overflow: TextOverflow.ellipsis,
                  //                     textAlign: TextAlign.left,
                  //                     style: AppStyle
                  //                         .txtPlusJakartaSansRomanRegular10WhiteA700),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         // CustomImageView(
                  //         //   svgPath: ImageConstant.imgStar,
                  //         //   height: getSize(48),
                  //         //   width: getSize(48),
                  //         //   margin: getMargin(left: 13, bottom: 9),
                  //         // )
                  //       ],
                  //     ),
                  //   ),
                  //   IconButton(
                  //     onPressed: (() {
                  //       _play(path);
                  //     }),
                  //     icon: Icon(FontAwesomeIcons.play),
                  //     color: Colors.white,
                  //   ),
                  //   // CustomImageView(
                  //   //   svgPath: ImageConstant.imgToplayermedia,
                  //   //   height: getVerticalSize(70),
                  //   //   width: getHorizontalSize(252),
                  //   //   margin: getMargin(left: 34, top: 33),
                  //   // ),
                  //   Container(
                  //     margin: getMargin(left: 10, top: 10, right: 20),
                  //     padding: getPadding(top: 3, bottom: 3),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: getPadding(left: 22, top: 9, bottom: 9),
                  //           child: Container(
                  //             height: getVerticalSize(4),
                  //             width: getHorizontalSize(252),
                  //             decoration: BoxDecoration(
                  //               color: ColorConstant.blueGray100,
                  //               borderRadius: BorderRadius.circular(
                  //                 getHorizontalSize(2),
                  //               ),
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(
                  //                 getHorizontalSize(2),
                  //               ),
                  //               child: LinearProgressIndicator(
                  //                 value: 0.35,
                  //                 backgroundColor: ColorConstant.blueGray100,
                  //                 valueColor: AlwaysStoppedAnimation<Color>(
                  //                     ColorConstant.gray700),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         CustomImageView(
                  //           svgPath: ImageConstant.imgMore,
                  //           height: getVerticalSize(14),
                  //           width: getHorizontalSize(3),
                  //           margin: getMargin(left: 22, top: 3, bottom: 3),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   Padding(
                  //     padding: getPadding(left: 127, top: 9),
                  //     child: Text("0:00 / 1:23",
                  //         overflow: TextOverflow.ellipsis,
                  //         textAlign: TextAlign.left,
                  //         style: AppStyle.txtRobotoRomanRegular14),
                  //   ),
                  //   CustomImageView(
                  //     svgPath: ImageConstant.imgFrame5,
                  //     height: getVerticalSize(49),
                  //     width: getHorizontalSize(225),
                  //     margin: getMargin(left: 48, top: 9, bottom: 28),
                  //   ),
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
