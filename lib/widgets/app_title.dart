import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UiHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UiHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.getTitleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              Constants.pokeballImageURL,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
