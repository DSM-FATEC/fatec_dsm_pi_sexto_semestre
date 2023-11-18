// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/spaces.dart';
import 'package:frontend/core/text_style.dart';
import 'package:frontend/pages/add-user/sign_up_page.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:frontend/pages/alerts_screen.dart';
import 'package:frontend/services/user_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var result;

  @override
  void initState() {
    // _auth();
    super.initState();
  }

  _auth(String email, String password) async {
    return result = await getAuth(userEmail.text, userPass.text);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
      child: Stack(children: [
        Image(
            image: Svg("assets/images/add-background.svg",
                size: Size(size.width, size.height))),
        Column(
          children: [
            Image(
              image: AssetImage("assets/images/logo.png"),
              width: 230,
            ),
            SpaceVH(height: 10.0),
            Text(
              'Acessar',
              style: headlineBlack,
            ),
            SpaceVH(height: 40.0),
            MyTextField(
              controller: userEmail,
              hintText: 'Nome',
              obscureText: false,
              labelText: 'Nome',
            ),
            SpaceVH(height: 20.0),
            MyTextField(
              controller: userPass,
              hintText: 'Senha',
              obscureText: false,
              labelText: 'Senha',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'esqueceu a senha?',
                    style: headlinepuple,
                  ),
                ),
              ),
            ),
            SpaceVH(
              height: 60.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  MyButton(
                    onTap: () async {
                      bool resulty = await _auth(userEmail.text, userPass.text);
                      print(resulty);
                      if (resulty) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlertsScreenHome(),
                            ));
                      }
                    },
                    text: 'Entrar',
                    btnColor: purpleButton,
                  ),
                  SpaceVH(height: 20.0),
                  MyButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => SignUpPage()));
                    },
                    text: 'Cadastrar',
                    btnColor: greenButton,
                  ),
                ],
              ),
            ),
            SpaceVH(height: 90.0),
          ],
        ),
      ]),
    ));
  }
}
