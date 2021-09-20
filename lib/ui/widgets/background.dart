import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({required this.child, this.img, Key? key}) : super(key: key);
  final Widget child;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(center: Alignment.topRight, radius: 2,
                  // end: Alignment.bottomLeft,

                  colors: [Colors.yellow.withOpacity(0.9), Colors.transparent]),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/${img ?? 'background'}.png')),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
