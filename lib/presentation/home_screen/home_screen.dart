import '../home_screen/widgets/favorites_item_widget.dart';
import '../home_screen/widgets/listpexelspixabay289324_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';
import 'package:WhaleTunes/widgets/app_bar/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: CustomAppBar(
                height: getVerticalSize(105),
                title: Container(
                    width: getHorizontalSize(72),
                    margin: getMargin(left: 30),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Good morning,\n",
                              style: TextStyle(
                                  color: ColorConstant.whiteA700,
                                  fontSize: getFontSize(10),
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: "John Doe",
                              style: TextStyle(
                                  color: ColorConstant.whiteA700,
                                  fontSize: getFontSize(14),
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w600))
                        ]),
                        textAlign: TextAlign.left)),
                actions: [
                  CustomImageView(
                      imagePath: ImageConstant.imgPexelsmohamed,
                      height: getSize(32),
                      width: getSize(32),
                      radius: BorderRadius.circular(getHorizontalSize(16)),
                      margin:
                          getMargin(left: 30, top: 12, right: 30, bottom: 11))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 5, bottom: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 30, right: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Your Favorites",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPlusJakartaSansRomanBold18),
                                Padding(
                                    padding: getPadding(top: 2, bottom: 4),
                                    child: Text("See all",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansRomanRegular12))
                              ])),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: getVerticalSize(236),
                              child: ListView.separated(
                                  padding: getPadding(left: 30, top: 15),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(16));
                                  },
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return FavoritesItemWidget(
                                        onTapFavorite: () =>
                                            onTapFavorite(context));
                                  }))),
                      Padding(
                          padding: getPadding(left: 30, top: 18, right: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("All WhaleTunes",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtPlusJakartaSansRomanBold18),
                                Padding(
                                    padding: getPadding(top: 2, bottom: 4),
                                    child: Text("See all",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansRomanRegular12))
                              ])),
                      Padding(
                          padding: getPadding(left: 30, top: 14, right: 30),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16));
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Listpexelspixabay289324ItemWidget();
                              }))
                    ]))));
  }

  onTapFavorite(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.playScreen);
  }
}
