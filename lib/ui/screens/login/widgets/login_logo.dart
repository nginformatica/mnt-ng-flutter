import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/assets.dart';

Widget LoginLogo({@required double width, @required double height}) {
  return Image.asset(
    Assets.mntLogoWhite,
    height: height,
    width: width,
  );
}
