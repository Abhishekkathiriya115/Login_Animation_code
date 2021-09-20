import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String svg;
  final double? h;
  final double? w;
  final bool? shader;
  const SvgIcon({
    Key? key,
    this.shader,
    required this.svg,
    this.h,
    this.w,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shader ?? true
        ? Center(
            child: ShaderMask(
              shaderCallback: (r) {
                return LinearGradient(colors: [
                  Color.fromRGBO(255, 224, 0, 1),
                  Color.fromRGBO(121, 159, 12, 1)
                ]).createShader(r);
              },
              child: SvgPicture.asset(
                'assets/$svg.svg',
                fit: BoxFit.contain,
                height: h,
                width: w,
              ),
            ),
          )
        : Center(
            child: SvgPicture.asset(
              'assets/$svg.svg',
              fit: BoxFit.contain,
              height: h,
              width: w,
            ),
          );
  }
}
