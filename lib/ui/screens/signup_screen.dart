import 'package:flutter/material.dart';
import 'package:mukminapp/ui/screens/login/login_screen.dart';
import 'package:mukminapp/ui/utils/styles.dart';
import 'package:mukminapp/ui/widgets/background.dart';
import 'package:mukminapp/ui/widgets/inputfield.dart';
import 'package:mukminapp/ui/widgets/logo_widget.dart';
import 'package:mukminapp/ui/widgets/social_button.dart';

import 'home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.backGroundColor,
      child: BackGround(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 10.0,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Logo(),
                          const SizedBox(height: 32.0),
                          Text(
                            'Daftar akaun',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 16.0),
                          CustomInputField(
                              hint: 'Name *', type: TextInputType.emailAddress),
                          const SizedBox(height: 16.0),
                          CustomInputField(
                              hint: 'Email *',
                              type: TextInputType.emailAddress),
                          const SizedBox(height: 16.0),
                          CustomInputField(
                              hint: 'Pilih kata laluan *',
                              type: TextInputType.emailAddress),
                          const SizedBox(height: 16.0),
                          CustomInputField(
                              hint: 'Sahkan kata laluan *',
                              type: TextInputType.visiblePassword),
                          const SizedBox(height: 16.0),
                          Text(
                            'Atau daftar menggunakan media sosial:',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialButton(
                                    svg: 'google', onPressed: _goToHome),
                                const SizedBox(width: 32.0),
                                SocialButton(
                                    svg: 'facebook',
                                    color: Colors.blue,
                                    onPressed: _goToHome),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios)),
                  top: 0.0,
                  left: 8.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goToHome() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
