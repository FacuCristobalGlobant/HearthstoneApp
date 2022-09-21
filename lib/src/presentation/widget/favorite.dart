import 'package:flutter/material.dart';
import 'package:hearthstoneapp/local_notice_service.dart';
import 'package:hearthstoneapp/src/core/util/notification_settings.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';

class Favorite extends StatefulWidget {
  final HearthstoneCard card;
  final FavoritesBloc favoritesBloc;
  const Favorite({super.key, required this.card, required this.favoritesBloc});
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.favoritesBloc.isFavorite(widget.card.cardId!),
      builder: (
        BuildContext context,
        AsyncSnapshot<bool> snapshot,
      ) {
        if (snapshot.hasData) {
          _isFavorite = snapshot.data!;
          return GestureDetector(
            onTap: () async {
              if (_isFavorite) {
                await widget.favoritesBloc.removeFavorite(widget.card.cardId!);
                setState(() {
                  _isFavorite = true;
                });
              } else {
                await widget.favoritesBloc.setFavorite(widget.card.cardId!);
                LocalNoticeService().showNotification(
                  NotificationSettings.id,
                  NotificationSettings.title,
                  '${widget.card.name!} ${NotificationSettings.title}',
                );
                setState(() {
                  _isFavorite = false;
                });
              }
              await widget.favoritesBloc.getFavorites();
            },
            child: Center(
              child: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                color: Palette.primaryColor,
                size: Styles.iconSizeFavorite,
              ),
            ),
          );
        } else {
          return const Center(
            child: Icon(
              Icons.favorite_border_sharp,
              color: Colors.grey,
              size: Styles.iconSizeFavorite,
            ),
          );
        }
      },
    );
  }
}
