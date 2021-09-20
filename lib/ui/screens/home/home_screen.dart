import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mukminapp/ui/screens/settings/settings_screen.dart';
import 'package:mukminapp/ui/widgets/background.dart';
import 'package:mukminapp/ui/widgets/bottom_meny.dart';
import 'package:mukminapp/ui/widgets/menu_item.dart';
import 'package:mukminapp/ui/widgets/post_item.dart';
import 'package:mukminapp/ui/widgets/svg_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 80.0;
  bool expanded = false;
  ScrollController? ctrl;
  String walpaper = 'homebackground';

  SharedPreferences? pref;
  @override
  void initState() {
    super.initState();
    ctrl = ScrollController();

    SharedPreferences.getInstance().then((value) {
      setState(() {
        pref = value;
        walpaper = pref?.getString('walpaper') ?? 'homebackground';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      img: walpaper,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          toolbarHeight: 0.0,
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomMent(
          expanded: expanded,
          index: 1,
          functions: {
            'settings': _goToSettings,
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.black54,
          onPressed: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Icon(
            !expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.amber,
          ),
        ),
        body: NotificationListener(
          onNotification: (n) {
            if (n is ScrollStartNotification) {
              setState(() {
                expanded = false;
              });
            }
            return false;
          },
          child: ListView(
            controller: ctrl,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    // SizedBox(height: 64.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Material(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16.0, left: 16.0, top: 8.0, bottom: 0.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/mosq.svg'),
                                  const SizedBox(width: 4.0),
                                  Text('Sekarang: Zohor',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14)),
                                  const SizedBox(width: 8.0),
                                  Text('(4h 38m)',
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Expanded(
                                      child: StreamBuilder(
                                    stream:
                                        Stream.periodic(Duration(seconds: 1)),
                                    initialData: DateTime.now(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      var h = DateTime.now().hour;
                                      var m = DateTime.now().minute;
                                      var hh = h > 12 ? h - 12 : h;
                                      var pm = h > 12;
                                      var mm = m >= 10 ? '$m' : '0$m';
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text('$hh:$mm',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          const SizedBox(width: 4.0),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(pm ? 'PM' : 'AM',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      );
                                    },
                                  )),
                                  Expanded(
                                      child: Material(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.black.withOpacity(0.15),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text('Kemudian: Asar',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                          const SizedBox(height: 8.0),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text('4:31',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              const SizedBox(width: 4.0),
                                              Text('PM',
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton.icon(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/location.svg'),
                                      label: Text(
                                        'Kuala Lumpur',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      )),
                                  TextButton.icon(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          'assets/calender.svg'),
                                      label: Text(
                                        'Selasa 30 Mei 2021 • 16 Shawal 1442H',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PostItem(img: 'post1'),
              PostItem(img: 'post2'),
              PostItem(img: 'post1'),
              PostItem(img: 'post2'),
              PostItem(img: 'post1'),
              SizedBox(height: 200.0),
            ],
          ),
        ),
      ),
    );
  }

  _goToSettings() async {
    setState(() {
      expanded = false;
    });
    var w = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
    await pref?.reload();
    setState(() {
      walpaper = pref?.getString('walpaper') ?? walpaper;
    });
  }
}
