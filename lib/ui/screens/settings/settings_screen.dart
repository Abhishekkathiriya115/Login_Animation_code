import 'package:flutter/material.dart';
import 'package:mukminapp/ui/screens/wallpapers/wallpaper_screen.dart';
import 'package:mukminapp/ui/utils/styles.dart';
import 'package:mukminapp/ui/widgets/background.dart';
import 'package:mukminapp/ui/widgets/bottom_meny.dart';
import 'package:mukminapp/ui/widgets/inputfield.dart';
import 'package:mukminapp/ui/widgets/menu_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool v1 = true;
  bool v2 = true;
  bool v3 = true;
  double height = 80.0;
  bool expanded = false;
  TextEditingController password = TextEditingController(text: '12345678');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(82, 82, 82, 1),
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
          title: Text("Tetapan"),
        ),
        bottomNavigationBar: BottomMent(
          functions: {'home': _goToHome},
          expanded: expanded,
          index: 16,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
            ? SizedBox()
            : FloatingActionButton(
                elevation: 0.0,
                backgroundColor: Colors.black54,
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Icon(
                  !expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.amber,
                ),
              ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NotificationListener(
            onNotification: (n) {
              if (n is ScrollStartNotification) {
                setState(() {
                  expanded = false;
                });
              }
              return false;
            },
            child: ListView(
              children: [
                _buildInputField(
                    title: 'Nama',
                    initial: 'Hafizzuddin Nizar',
                    type: TextInputType.name),
                const SizedBox(height: 8.0),
                _buildInputField(
                    title: 'Email',
                    initial: 'hafizzuddin@gmail.com.my',
                    type: TextInputType.emailAddress),
                const SizedBox(height: 8.0),
                _buildInputField(
                    title: 'Nombor Telefon',
                    initial: '0192039053',
                    type: TextInputType.phone),
                const SizedBox(height: 8.0),
                _buildInputField(
                    title: 'Kata Laluan',
                    // initial: '123456789',
                    ctrl: password,
                    obscur: true,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: MaterialButton(
                        onPressed: () {
                          password.clear();
                        },
                        color: Color.fromRGBO(82, 77, 159, 1),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          'tukar',
                        ),
                      ),
                    ),
                    type: TextInputType.visiblePassword),
                const SizedBox(height: 8.0),
                Divider(
                  color: Colors.white60,
                  thickness: 1.5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: _goToWallpaper,
                    child: Text(
                      'Tukar Wallpaper',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white60,
                  thickness: 1.5,
                ),
                Center(
                  child: SizedBox(
                    width: 280.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color.fromRGBO(40, 40, 40, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Naik taraf ke ‘Premium’',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'RM19.00 sekali seumur hidup',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(162, 204, 128, 1),
                                ),
                              ),
                            )),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CheckboxListTile(
                                activeColor: Colors.green,
                                value: v1,
                                onChanged: (v) {
                                  setState(() {
                                    v1 = v ?? v1;
                                  });
                                },
                                title: Text(
                                  'Pilih dan tukar design Kiblat',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CheckboxListTile(
                                activeColor: Colors.green,
                                value: v2,
                                onChanged: (v) {
                                  setState(() {
                                    v2 = v ?? v2;
                                  });
                                },
                                title: Text(
                                  'Pilih dan tukar design Tasbih',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CheckboxListTile(
                                activeColor: Colors.green,
                                value: v3,
                                onChanged: (v) {
                                  setState(() {
                                    v3 = v ?? v3;
                                  });
                                },
                                title: Text(
                                  'Pilih dan tukar design Tasbih',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: MaterialButton(
                                  onPressed: _goToHome,
                                  color: Color.fromRGBO(82, 77, 159, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Text(
                                    'Naik taraf sekarang',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ));
  }

  _goToHome() {
    Navigator.of(context).pop();
  }

  _goToWallpaper() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WallpaperScreen()));
  }

  Widget _buildInputField(
      {required String title,
      Widget? suffix,
      bool obscur = false,
      String? initial,
      TextEditingController? ctrl,
      TextInputType? type}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            )),
        const SizedBox(height: 8.0),
        CustomInputField(
          suffix: suffix,
          type: type,
          ctrl: ctrl,
          initial: initial,
          obscur: obscur,
          padding: EdgeInsets.symmetric(horizontal: 0.0),
        ),
      ],
    );
  }
}
