// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/core/colors.dart';
import 'package:frontend/core/spaces.dart';
import 'package:frontend/core/text_style.dart';
import 'package:frontend/pages/login/sign_in_page.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:frontend/services/user_service.dart';
import 'package:frontend/pages/alerts_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassConfirm = TextEditingController();

  var result;

  _createUser(String name, String email, String password, String confirmPassword) async {
    if(password == confirmPassword){
      return result = await createUser(userName.text, userEmail.text, userPass.text);
    } else {
      false;
    }
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
                'Cadastro',
                style: headlineBlack,
              ),
              SpaceVH(height: 20.0),
              MyTextField(
                controller: userName,
                hintText: 'Nome',
                obscureText: false,
                labelText: 'Nome',
              ),
              SpaceVH(height: 7.0),
              MyTextField(
                controller: userEmail,
                hintText: 'Email',
                obscureText: false,
                labelText: 'Email',
              ),
              SpaceVH(height: 7.0),
              MyTextField(
                controller: userPass,
                hintText: 'Senha',
                obscureText: false,
                labelText: 'Senha',
              ),
              SpaceVH(height: 7.0),
              MyTextField(
                controller: userPassConfirm,
                hintText: 'Confirmar Senha',
                obscureText: false,
                labelText: 'Confirmar Senha',
              ),
              SpaceVH(height: 40.0),
              MyButton(
                onTap: () async {
                  bool resulty = await _createUser(userName.text, userEmail.text, userPass.text, userPassConfirm.text);
                  if(resulty){
                    // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlertsScreenHome(),
                            ));
                  }
                },
                text: 'Cadastrar',
                btnColor: purpleButton,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => SignInPage()));
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Possui conta? ',
                      style: headlineBlack.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Login',
                      style: headlineDotPurple.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              ),
              SpaceVH(height: 110.0),
            ],
          ),
        ]
      ),
    ));
  }
}
