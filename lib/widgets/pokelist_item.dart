import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/pages/detail_page.dart';
import 'package:pokedex_app/widgets/poke_imageAndBall.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UiHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UiHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? 'N/A',
                style: Constants.getPokemonNameTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                ),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
