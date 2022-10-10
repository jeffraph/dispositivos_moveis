import 'package:flutter/material.dart';
import 'package:pdv_flutter/controllers/autenticacao.controller.dart';
import 'package:pdv_flutter/pages/cadastro.page.dart';
import 'package:pdv_flutter/pages/home.page.dart';
import 'package:pdv_flutter/utils/constantes.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(
        top: 50,
        left: 30,
        right: 30,
      ),
      color: Colors.white,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                ConstantesPDV.logo,
              ),
            ),
            Text(
              'D O G  L I F E',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 0.2, 0.8, 1],
                  colors: [
                    Color.fromRGBO(163, 211, 240, 1),
                    Color.fromRGBO(108, 184, 243, 1),
                    Color.fromRGBO(206, 83, 171, 1),
                    Color.fromRGBO(248, 151, 178, 1),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                  onPressed: () async {
                    AutenticacaoController autenticadorController =
                        AutenticacaoController();

                    bool dadosValidos =
                        await autenticadorController.validarLogin(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (dadosValidos) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        ModalRoute.withName('/home'),
                      );
                    } else {
                      print("FALHA NA AUTENTICACAO");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledForegroundColor:
                        Colors.transparent.withOpacity(0.38),
                    disabledBackgroundColor:
                        Colors.transparent.withOpacity(0.12),
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'ENTRAR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.topLeft,
                  stops: [0, 0.2, 0.8, 1],
                  colors: [
                    Color.fromRGBO(163, 211, 240, 1),
                    Color.fromRGBO(108, 184, 243, 1),
                    Color.fromRGBO(206, 83, 171, 1),
                    Color.fromRGBO(248, 151, 178, 1),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CadastroPage()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledForegroundColor:
                        Colors.transparent.withOpacity(0.38),
                    disabledBackgroundColor:
                        Colors.transparent.withOpacity(0.12),
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color.fromRGBO(100, 115, 235, 1),
    Color.fromRGBO(108, 184, 243, 1),
    Color.fromRGBO(248, 151, 178, 1)
  ],
).createShader(const Rect.fromLTWH(0.0, 0, 200.0, 10.0));
