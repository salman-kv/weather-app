import 'dart:ui';

import 'package:flutter/material.dart';

class ContainerWidget {
  backgroundContainer() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            .2,
            .3,
            .9
          ],
              colors: [
            Colors.orange,
            Colors.purple,
            Colors.black,
          ])),
    );
  }

  backdropFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
      child: Container(decoration: const BoxDecoration(color: Colors.transparent)),
    );
  }
}
