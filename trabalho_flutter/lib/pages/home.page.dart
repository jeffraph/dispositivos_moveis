import 'package:flutter/material.dart';
import 'package:pdv_flutter/controllers/home.controller.dart';
import 'package:pdv_flutter/models/usuario.model.dart';
import 'package:pdv_flutter/pages/login.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UsuarioModel? dadosDoUsuario;

  HomeController homeController = HomeController();

  carregarDadosDoUsuario() async {
    UsuarioModel usuarioLocal = await homeController.popularUsuario();
    setState(() {
      dadosDoUsuario = usuarioLocal;
    });
  }

  @override
  void initState() {
    carregarDadosDoUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Bem-vindo(a), ${dadosDoUsuario?.nomeDeUsuario}",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: "Deslogar",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(title: "Login"),
                ),
                ModalRoute.withName('/login'),
              );
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                child: Text("Nome: ${dadosDoUsuario?.nomeDeUsuario}"),
              ),
              Text("Email: ${dadosDoUsuario?.email}"),
            ],
          ),
        ),
      ),
    );
  }
}
