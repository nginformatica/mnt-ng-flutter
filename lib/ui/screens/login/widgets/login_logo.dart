import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/assets.dart';

Widget loginLogo({@required double width, @required double height}) =>
    Image.asset(
      Assets.mntLogoWhite,
      height: height,
      width: width,
    );
