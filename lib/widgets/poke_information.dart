import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoRow('Name', pokemon.name),
            _buildInfoRow('Height', pokemon.height),
            _buildInfoRow('Weight', pokemon.weight),
            _buildInfoRow('Spawn Time', pokemon.spawnTime),
            _buildInfoRow('Weakness', pokemon.weaknesses),
            _buildInfoRow('Pre Evolution', pokemon.prevEvolution),
            _buildInfoRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInfoRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(" , "),
            style: Constants.getPokeInfoTextStyle(),
          )
        else if (value == null)
          const Text("Bilgi Yok")
        else
          Text(
            value,
            style: Constants.getPokeInfoTextStyle(),
          )
      ],
    );
  }
}
