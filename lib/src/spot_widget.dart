import 'package:a_star/src/spot_model.dart';
import 'package:flutter/material.dart';

class SpotWidget extends StatelessWidget {
  const SpotWidget(
      {Key? key, required this.spot, required this.color, required this.onTap})
      : super(key: key);

  final Spot spot;

  final Color color;
  final Function(Spot) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(spot);
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
      ),
    );
  }
}
