import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';
import 'package:WhaleTunes/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgPexelsandreaholien892548,
                  height: getVerticalSize(605),
                  width: getHorizontalSize(375),
                  alignment: Alignment.topCenter),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: getPadding(left: 30, top: 20, right: 30, bottom: 20),
                  decoration: AppDecoration.fillGray900.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Welcome to WhaleTunes",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPlusJakartaSansRomanBold24),
                      Padding(
                          padding: getPadding(top: 20),
                          child: Text(
                              "You’re only a few clicks away from listening to the beautiful sounds of whale with only a tap.",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style:
                                  AppStyle.txtPlusJakartaSansRomanRegular10)),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "Get Started",
                          margin: getMargin(top: 52, bottom: 46),
                          onTap: () => onTapGetstarted(context))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapGetstarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }
}
