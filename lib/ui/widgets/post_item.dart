import 'package:flutter/material.dart';
import 'package:mukminapp/ui/widgets/svg_icon.dart';

class PostItem extends StatelessWidget {
  final String img;
  const PostItem({required this.img, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8.0),
          Container(
            color: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: SvgIcon(
                    svg: 'quran',
                    h: 18,
                    w: 18,
                  ),
                  label: Text('Ayat Quran Pilihan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: SvgIcon(
                        svg: 'share',
                        shader: false,
                      ),
                      label: Text('Share',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: SvgIcon(
                        svg: 'more',
                        shader: false,
                      ),
                      label: Text('More',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              constraints: BoxConstraints(maxHeight: 500.0),
              color: Colors.red,
              child: Image.asset(
                'assets/$img.png',
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
