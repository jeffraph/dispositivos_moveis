import 'dart:convert';
import 'package:pdv_flutter/models/usuario.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  final Future<SharedPreferences> repo = SharedPreferences.getInstance();

  Future<void> salvarUsuario(UsuarioModel usuario) async {
    SharedPreferences localRepo = await repo;
    await localRepo.setString('usuario', usuario.toString());
  }

  Future<String?> pegarDadosDoUsuario() async {
    SharedPreferences localRepo = await repo;
    return localRepo.getString("usuario");
  }

  verificarSenha(String senhaDigitada) async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if (senhaDigitada == dadosDoUsuario["senha"]) {
      return true;
    }
    return false;
  }

  verificarEmail(String emailDigitado) async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    if (emailDigitado == dadosDoUsuario["email"]) {
      return true;
    }
    return false;
  }

  Future<String?> retornarNomeUsuario() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDoUsuario = jsonDecode(dados!);

    return dadosDoUsuario["nomeDoUsuario"];
  }

  Future<Map<String, dynamic>> retornarNomeEEmail() async {
    SharedPreferences localRepo = await repo;

    String? dados = localRepo.getString("usuario");

    Map<String, dynamic> dadosDecodificados = jsonDecode(dados!);

    Map<String, dynamic> nomeEmail = {
      "nome": dadosDecodificados["nomeDoUsuario"],
      "email": dadosDecodificados["email"],
    };

    return nomeEmail;
  }
}
