import 'package:flutter/material.dart';

import 'menu_item.dart';

class BottomMent extends StatelessWidget {
  final bool expanded;
  final int index;
  final Map<String, Function()> functions;
  const BottomMent(
      {required this.expanded,
      required this.functions,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SharedPreferences.getInstance().then((value) => value.remove('walpaper'));
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: expanded ? 250 : 70,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.0))),
      child: !expanded
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              MenuItem(
                svg: 'home',
                label: 'Utama',
                onTap: functions['home'],
              ),
              MenuItem(
                svg: 'qiblat',
                label: 'Qiblat',
                onTap: functions['qiblat'],
              ),
              MenuItem(
                svg: 'quran',
                label: 'Quran',
                onTap: functions['quran'],
              ),
              MenuItem(
                svg: 'hadith',
                label: 'Hadith',
                onTap: functions['hadith'],
              ),
            ])
          : Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuItem(
                              svg: 'home',
                              label: 'Utama',
                              onTap: functions['home'],
                            ),
                            MenuItem(
                              svg: 'qiblat',
                              label: 'Qiblat',
                              onTap: functions['qiblat'],
                            ),
                            MenuItem(
                              svg: 'quran',
                              label: 'Quran',
                              onTap: functions['home'],
                            ),
                            MenuItem(
                              svg: 'hadith',
                              label: 'Hadith',
                              onTap: functions['quran'],
                            ),
                          ]),
                      const SizedBox(height: 4.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuItem(
                              svg: 'doa',
                              label: 'Doa',
                              onTap: functions['doa'],
                            ),
                            MenuItem(
                              svg: 'article',
                              label: 'Artikel',
                              onTap: functions['article'],
                            ),
                            MenuItem(
                              svg: 'donation',
                              label: 'Sumbangan',
                              onTap: functions['donation'],
                            ),
                            MenuItem(
                              svg: 'mosque',
                              label: 'Masjid/Surau',
                              onTap: functions['mosque'],
                            ),
                          ]),
                      const SizedBox(height: 4.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuItem(
                              svg: 'calendar',
                              label: 'Kalendar',
                              onTap: functions['calendar'],
                            ),
                            MenuItem(
                              svg: 'remembrance',
                              label: 'Zikir',
                              onTap: functions['remembrance'],
                            ),
                            MenuItem(
                              svg: 'restaurant',
                              label: 'Restoran Halal',
                              onTap: functions['restaurant'],
                            ),
                            MenuItem(
                              svg: 'sirah',
                              label: 'Sirah',
                              onTap: functions['sirah'],
                            ),
                          ]),
                      const SizedBox(height: 4.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuItem(
                              svg: 'calendar',
                              label: 'Motivasi',
                              onTap: functions['calendar'],
                            ),
                            MenuItem(
                              svg: 'sirah',
                              label: 'Sirah',
                              onTap: functions['sirah'],
                            ),
                            MenuItem(
                              svg: 'restaurant',
                              label: 'Restoran Halal',
                              onTap: functions['restaurant'],
                            ),
                            MenuItem(
                              svg: 'settings',
                              label: 'Tetapan',
                              onTap: functions['settings'],
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // _goToSettings(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
  // }
}
