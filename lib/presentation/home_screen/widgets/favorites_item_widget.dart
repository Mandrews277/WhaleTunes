import 'package:flutter/material.dart';
import 'package:WhaleTunes/core/app_export.dart';

// ignore: must_be_immutable
class FavoritesItemWidget extends StatelessWidget {
  FavoritesItemWidget({this.onTapFavorite});

  VoidCallback? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapFavorite!();
          },
          child: Container(
            margin: getMargin(
              right: 16,
            ),
            padding: getPadding(
              left: 14,
              top: 13,
              right: 14,
              bottom: 13,
            ),
            decoration: AppDecoration.fillGray90001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgPexelseliannedipp4666750,
                  height: getVerticalSize(
                    140,
                  ),
                  width: getHorizontalSize(
                    166,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      24,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 2,
                    top: 12,
                  ),
                  child: Text(
                    "Humpback Whale",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansRomanBold16WhiteA700,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 2,
                    top: 4,
                  ),
                  child: Text(
                    "July 12th, 2022",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansRomanMedium12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
