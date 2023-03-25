import 'package:WhaleTunes/presentation/play_screen/play_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';

// ignore: must_be_immutable
class WhaleTuneTile extends StatelessWidget {
  late Reference item;
  late String URL;
  WhaleTuneTile(this.item, this.URL);

  @override
  Widget build(BuildContext context) {
    print(URL);
    return Card(
      /* padding: getPadding(
        all: 14,
      ),
      decoration: AppDecoration.fillGray90001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ), */
      margin: const EdgeInsets.all(10),
      color: AppDecoration.fillGray90001.color,
      child: new InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPexelspixabay289324,
                height: getVerticalSize(
                  94,
                ),
                width: getHorizontalSize(
                  125,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    15,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 14,
                  top: 6,
                  bottom: 21,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansRomanBold16WhiteA700,
                    ),
                    Padding(
                      padding: getPadding(
                        left: 1,
                        top: 5,
                      ),
                      child: Text(
                        "August 1st, 2022",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansRomanMedium12,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 10,
                      ),
                      child: Text(
                        "2 min 16 sec",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtPlusJakartaSansRomanRegular10WhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new PlayScreen(URL: URL)));
          }),
    );
  }
}
