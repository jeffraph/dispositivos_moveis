import 'package:pdv_flutter/models/usuario.model.dart';
import 'package:pdv_flutter/repository/usuario.repository.dart';

class AutenticacaoController {
  UsuarioRepository userRepository = UsuarioRepository();

  List<String> listaDeDominiosPermitidos = [
    "gmail.com",
    "yahoo.com",
    "bol.com.br",
    "live.com",
    "outlook.com",
    "hotmail.com",
  ];

  bool validarEmail(String email) {
    bool emailValido = false;

    List<String> usuarioEDominio = email.split("@");

    if (email.contains("@")) {
      for (var dominio in listaDeDominiosPermitidos) {
        if (usuarioEDominio[1] == dominio) {
          emailValido = true;
          break;
        }
      }
    }

    return emailValido;
  }

  bool verificarSeAsSenhasSaoIguais(String senha1, String senha2) {
    return senha1 == senha2;
  }

  bool validarSenha(String senha) {
    bool senhaValida = false;

    if (senha.length >= 8) {
      senhaValida = true;
    }

    return senhaValida;
  }

  Future<bool> _verificarEmail(String email) async {
    return await userRepository.verificarEmail(email);
  }

  Future<bool> _verificarSenha(String senha) async {
    return await userRepository.verificarSenha(senha);
  }

  Future<bool> validarLogin(String email, String senha) async {
    bool emailCadastrado = await _verificarEmail(email);
    bool senhaCadastrada = await _verificarSenha(senha);

    if (validarEmail(email) &&
        validarSenha(senha) &&
        emailCadastrado &&
        senhaCadastrada) {
      return true;
    }
    return false;
  }

  Future<void> cadastrarUsuario(UsuarioModel usuarioModel) async {
    await userRepository.salvarUsuario(usuarioModel);
  }
}
