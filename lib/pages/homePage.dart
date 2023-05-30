import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/app_title.dart';

import '../widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppTitle(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
