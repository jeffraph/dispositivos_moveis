import 'dart:convert';

class UsuarioModel {
  String? nomeDeUsuario;
  int? idade;
  String? email;
  String? senha;

  UsuarioModel({
    required this.nomeDeUsuario,
    required this.idade,
    required this.email,
    required this.senha,
  });

  UsuarioModel.usuarioVazio();

  UsuarioModel.fromMap(Map<String, dynamic> dados) {
    email = dados['email'];
    nomeDeUsuario = dados['nome'];
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeDoUsuario": nomeDeUsuario,
      "idade": idade,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
