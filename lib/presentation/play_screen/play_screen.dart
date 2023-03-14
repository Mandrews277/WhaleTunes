import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            body: Container(
                height: size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          decoration: AppDecoration.fillBluegray100,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant
                                        .imgPexelseliannedipp4666750524x375,
                                    height: getVerticalSize(524),
                                    width: getHorizontalSize(375))
                              ]))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: getPadding(all: 22),
                          decoration: AppDecoration.fillGray900.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL40),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(left: 9),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 4),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowleft,
                                                              height:
                                                                  getVerticalSize(
                                                                      40),
                                                              width:
                                                                  getHorizontalSize(
                                                                      24),
                                                              onTap: () {
                                                                onTapImgArrowleft(
                                                                    context);
                                                              }),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 29,
                                                                      top: 4,
                                                                      bottom:
                                                                          4),
                                                              child: Text(
                                                                  "Humpback Whale",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtPlusJakartaSansRomanBold24))
                                                        ]),
                                                    Padding(
                                                        padding: getPadding(
                                                            right: 25),
                                                        child: Text(
                                                            "Audio captured on July 12th, 2022",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPlusJakartaSansRomanRegular10WhiteA700))
                                                  ])),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgStar,
                                              height: getSize(48),
                                              width: getSize(48),
                                              margin: getMargin(
                                                  left: 13, bottom: 9))
                                        ])),
                                CustomImageView(
                                    svgPath: ImageConstant.imgToplayermedia,
                                    height: getVerticalSize(70),
                                    width: getHorizontalSize(252),
                                    margin: getMargin(left: 34, top: 33)),
                                Container(
                                    margin:
                                        getMargin(left: 10, top: 10, right: 20),
                                    padding: getPadding(top: 3, bottom: 3),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 22, top: 9, bottom: 9),
                                              child: Container(
                                                  height: getVerticalSize(4),
                                                  width: getHorizontalSize(252),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .blueGray100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  2))),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(
                                                          getHorizontalSize(2)),
                                                      child: LinearProgressIndicator(
                                                          value: 0.35,
                                                          backgroundColor:
                                                              ColorConstant
                                                                  .blueGray100,
                                                          valueColor:
                                                              AlwaysStoppedAnimation<Color>(
                                                                  ColorConstant
                                                                      .gray700))))),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgMore,
                                              height: getVerticalSize(14),
                                              width: getHorizontalSize(3),
                                              margin: getMargin(
                                                  left: 22, top: 3, bottom: 3))
                                        ])),
                                Padding(
                                    padding: getPadding(left: 127, top: 9),
                                    child: Text("0:00 / 1:23",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtRobotoRomanRegular14)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgFrame5,
                                    height: getVerticalSize(49),
                                    width: getHorizontalSize(225),
                                    margin:
                                        getMargin(left: 48, top: 9, bottom: 28))
                              ])))
                ]))));
  }

  onTapImgArrowleft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
