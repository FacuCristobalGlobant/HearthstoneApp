import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/assets.dart';
import 'package:hearthstoneapp/src/core/util/keys.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class GridCardItem extends StatelessWidget {
  final String? image;
  final String name;
  final String type;
  final String cardSet;

  const GridCardItem({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.cardSet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Keys.gridItemKey,
      padding: Styles.smallPadding,
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.circular(Styles.containerRadius),
        boxShadow: Styles.containerShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (image != null)
            Image.network(
              image!,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            )
          else
            Image.asset(Assets.defaultImage),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                  padding: Styles.verticalSmallPadding,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    name,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: Styles.largeFontSize,
                    ),
                  ),
                ),
              ),
              Text(
                type,
                style: Styles.iconFontTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                cardSet,
                style: Styles.iconFontTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
