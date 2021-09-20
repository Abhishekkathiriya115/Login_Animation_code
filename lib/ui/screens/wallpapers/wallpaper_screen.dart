import 'package:flutter/material.dart';
import 'package:mukminapp/ui/utils/styles.dart';
import 'package:mukminapp/ui/widgets/bottom_meny.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({Key? key}) : super(key: key);

  @override
  _WallpaperScreenState createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  List<String> wallpapers = [
    'w1',
    'w2',
    'w3',
    'w4',
    'w5',
    'w6',
  ];
  SharedPreferences? pref;
  bool expanded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        pref = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color.fromRGBO(82, 82, 82, 1),
      bottomNavigationBar: BottomMent(
        functions: {
          'settings': _goToSettings,
          'home': _goToHome,
        },
        expanded: expanded,
        index: 16,
      ),
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            Container(
              color: Styles.backGroundColor,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 1],
                    colors: [Colors.amber, Colors.transparent]),
                image: DecorationImage(
                  image: AssetImage('assets/appbarbackground.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        title: Text("Tukar Wallpaper"),
      ),
      body: pref == null
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: NotificationListener(
                onNotification: (n) {
                  if (n is ScrollStartNotification) {
                    setState(() {
                      expanded = false;
                    });
                  }
                  return false;
                },
                child: GridView.builder(
                    itemCount: wallpapers.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    itemBuilder: (c, i) {
                      return GestureDetector(
                        onTap: () async {
                          await pref?.setString('walpaper', wallpapers[i]);
                          Navigator.of(context).pop();
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border:
                                (pref?.getString('walpaper') == wallpapers[i])
                                    ? Border.all(
                                        width: 4,
                                        color: Colors.amber,
                                      )
                                    : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              'assets/${wallpapers[i]}.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
    );
  }

  _goToHome() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  _goToSettings() {
    Navigator.of(context).pop();
  }
}
