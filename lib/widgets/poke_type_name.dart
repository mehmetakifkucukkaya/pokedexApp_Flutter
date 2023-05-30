import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokeNameAndType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameAndType({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: Constants.getPokemonNameTextStyle(),
                ),
              ),
              Text(
                "#${pokemon.num}",
                style: Constants.getPokemonNameTextStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Chip(
            label: Text(
              pokemon.type?.join(" , ") ?? '',
              style: Constants.getTypeChipTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
