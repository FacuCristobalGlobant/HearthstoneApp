import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/card_list_container.dart';
import 'package:hearthstoneapp/src/presentation/widget/not_found.dart';

class FavoritesList extends StatelessWidget {
  final FavoritesBloc favoritesBloc;

  const FavoritesList(this.favoritesBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse>(
      key: UniqueKey(),
      stream: favoritesBloc.getCardListStream(),
      builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data!.state) {
            case ApiResponseState.empty:
              return const NotFound();
            case ApiResponseState.success:
              return CardListContainer(
                snapshot.data!.listOfCards!,
                favoritesBloc,
              );
            case ApiResponseState.error:
              return Text(
                snapshot.error.toString(),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
