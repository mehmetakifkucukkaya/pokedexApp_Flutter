import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); //* Bu sayede artık bu sınıftan nesne üretilemez.

  static const String title = 'Pokedex';

  static const String pokeballImageURL = 'images/pokeball.png';

  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(48));
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(24));
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: _calculateFontSize(20));
  }

  //* Telefondaki yazı boyutu ayarına göre fontsize'ı belirleyen metot
  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.4);
    }
  }

  static getPokeInfoTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(15), color: Colors.black);
  }

  static getPokeInfoLabelTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(20),
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }
}
