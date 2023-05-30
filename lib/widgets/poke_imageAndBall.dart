import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(Constants.pokeballImageURL,
              width: UiHelper.calculatePokeImageAndBallSize(),
              height: UiHelper.calculatePokeImageAndBallSize(),
              fit: BoxFit.fitHeight),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
                placeholder: ((context, url) =>
                    const CircularProgressIndicator(
                      color: Colors.red,
                    )),
                imageUrl: pokemon.img ?? "",
                width: UiHelper.calculatePokeImageAndBallSize(),
                height: UiHelper.calculatePokeImageAndBallSize(),
                fit: BoxFit.fitHeight),
          ),
        ),
      ],
    );
  }
}
