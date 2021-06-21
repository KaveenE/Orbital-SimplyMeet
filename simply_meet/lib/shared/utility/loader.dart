import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loaders {
  static final Loaders _singleton = Loaders._();
  static Loaders get singleton => _singleton;
  Loaders._();

  Widget  cubeGrid(double size) => SpinKitCubeGrid(
        color: Colors.white,
        size: size,
      );

  Widget  wave(double size) => FittedBox(
        child: SpinKitWave(
          color: Colors.white,
          size: size,
        ),
      );
}
