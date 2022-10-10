import 'package:flutter/material.dart';
import 'package:pdv_flutter/controllers/autenticacao.controller.dart';
import 'package:pdv_flutter/models/usuario.model.dart';
import '../utils/constantes.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

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
                  ConstantesPDV.profile,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          labelText: 'Nome do usuário',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _idadeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Idade',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _password1Controller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _password2Controller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar Senha',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.center,
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

                              bool senhasIguais = autenticadorController
                                  .verificarSeAsSenhasSaoIguais(
                                _password1Controller.text,
                                _password2Controller.text,
                              );

                              bool emailValido = autenticadorController
                                  .validarEmail(_emailController.text);
                              bool senhaValida = autenticadorController
                                  .validarSenha(_password1Controller.text);

                              if (senhasIguais && emailValido && senhaValida) {
                                UsuarioModel usuario = UsuarioModel(
                                  nomeDeUsuario: _nomeController.text,
                                  idade: int.parse(_idadeController.text),
                                  email: _emailController.text,
                                  senha: _password1Controller.text,
                                );

                                await autenticadorController
                                    .cadastrarUsuario(usuario);

                                Navigator.pop(context);
                              } else {
                                print("Senhas iguais $senhasIguais");
                                print("Email valido $emailValido");
                                print("Senha valida $senhaValida");
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
                              'Cadastrar Dados',
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
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            disabledForegroundColor:
                                Colors.transparent.withOpacity(0.38),
                            disabledBackgroundColor:
                                Colors.transparent.withOpacity(0.12),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
