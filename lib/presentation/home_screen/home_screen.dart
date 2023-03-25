import 'package:WhaleTunes/main.dart';
import 'package:WhaleTunes/presentation/sign_up_screen/sign_up_screen.dart';
import '../home_screen/widgets/favorites_item_widget.dart';
import 'widgets/WhaleTuneTile.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';
import 'package:WhaleTunes/widgets/app_bar/custom_app_bar.dart';
import 'package:WhaleTunes/services/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatelessWidget {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<ListResult> _listAllItems() async {
    return _storageRef.listAll();
  }

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
              textDirection: TextDirection.ltr,
              text: TextSpan(
                children: [
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
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          actions: [
            InkWell(
              onTap: () async {
                await AuthService().signOut();
                Navigator.of(context, rootNavigator: true).pop(context);
                Navigator.pushNamed(context, AppRoutes.signUpScreen);
              },
              child: Container(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(ImageConstant.imgPexelsmohamed),
                    radius: 16,
                  ),
                ),
                margin: EdgeInsets.all(30),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: _listAllItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data?.items;
              return Container(
                width: double.maxFinite,
                padding: getPadding(top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Padding(
                    //     padding: getPadding(left: 30, right: 30),
                    //     child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text("Your Favorites",
                    //               overflow: TextOverflow.ellipsis,
                    //               textAlign: TextAlign.left,
                    //               style:
                    //                   AppStyle.txtPlusJakartaSansRomanBold18),
                    //           Padding(
                    //               padding: getPadding(top: 2, bottom: 4),
                    //               child: Text("See all",
                    //                   overflow: TextOverflow.ellipsis,
                    //                   textAlign: TextAlign.left,
                    //                   style: AppStyle
                    //                       .txtPlusJakartaSansRomanRegular12))
                    //         ])),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Container(
                    //         height: getVerticalSize(236),
                    //         child: ListView.separated(
                    //             padding: getPadding(left: 30, top: 15),
                    //             scrollDirection: Axis.horizontal,
                    //             separatorBuilder: (context, index) {
                    //               return SizedBox(height: getVerticalSize(16));
                    //             },
                    //             itemCount: 3,
                    //             itemBuilder: (context, index) {
                    //               return FavoritesItemWidget(
                    //                   onTapFavorite: () =>
                    //                       onTapFavorite(context));
                    //             }))),
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
                              // Padding(
                              //     padding: getPadding(top: 2, bottom: 4),
                              //     child: Text("See all",
                              //         overflow: TextOverflow.ellipsis,
                              //         textAlign: TextAlign.left,
                              //         style: AppStyle
                              //             .txtPlusJakartaSansRomanRegular12))
                            ])),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items?.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: getURL(items![index]),
                            builder: ((context, snapshot) {
                              if (snapshot.hasData) {
                                String URL = snapshot.data.toString();
                                return WhaleTuneTile(items[index], URL);
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                      'Error: ${snapshot.error.toString()}'),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  onTapFavorite(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.playScreen);
  }

  Future<String> getURL(Reference item) async {
    String URL = await _storageRef.child(item.fullPath).getDownloadURL();
    return URL;
  }
}
