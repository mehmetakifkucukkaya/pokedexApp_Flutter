import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_type_name.dart';

import '../widgets/poke_information.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLandscapeBody();
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(widget.pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UiHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 24.w,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            PokeNameAndType(pokemon: widget.pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  height: 0.15.sh,
                  right: 0,
                  top: 50,
                  child: Image.asset(Constants.pokeballImageURL,
                      fit: BoxFit.fitHeight),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.18.sh,
                  child: PokeInformation(
                    pokemon: widget.pokemon,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: widget.pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: widget.pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  _buildLandscapeBody() {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(widget.pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UiHelper.getIconPadding(),
              child: IconButton(
                  iconSize: 18.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokeNameAndType(pokemon: widget.pokemon),
                        Expanded(
                          child: Hero(
                            tag: widget.pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: widget.pokemon.img ?? '',
                              height: 0.4.sh,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UiHelper.getDefaultPadding(),
                        child: PokeInformation(pokemon: widget.pokemon),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
