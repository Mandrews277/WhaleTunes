import 'package:WhaleTunes/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';
import 'package:WhaleTunes/widgets/custom_button.dart';
import 'package:WhaleTunes/services/auth.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 30,
            right: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgVolume,
                height: getSize(
                  100,
                ),
                width: getSize(
                  100,
                ),
                margin: getMargin(
                  top: 41,
                ),
              ),
              Container(
                decoration: AppDecoration.txtOutlineBlack9003f,
                child: Text(
                  "WhaleTunes",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanBold48,
                ),
              ),
              Spacer(),
              CustomButton(
                height: getVerticalSize(
                  56,
                ),
                text: "Sign up with Email",
                onTap: () async {
                  await AuthService().signOut();
                  Navigator.pushNamed(context, AppRoutes.onBoardingScreen);
                },
              ),
              CustomButton(
                height: getVerticalSize(
                  56,
                ),
                text: "Sign up with Google",
                margin: getMargin(
                  top: 21,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 24,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already signed up? ",
                        style: TextStyle(
                          color: ColorConstant.whiteA700Dd,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: getHorizontalSize(
                            0.5,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "Login Here!",
                        style: TextStyle(
                          color: ColorConstant.lightBlue700,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: getHorizontalSize(
                            0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
