import 'package:flutter/material.dart';
import 'package:flutter_rotas/login.dart';
import 'package:flutter_rotas/inicio.dart'; // Import Inicio page

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String _usuario = 'fulano';
  final String _senha = '123456';

  String? _textoErroUsuario;

  final TextEditingController _controlaCampoUsuario = TextEditingController();
  final TextEditingController _controlaCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: Container(), // No leading icon
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Adjusted alignment
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            child: TextField(
              controller: _controlaCampoUsuario,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'usuário',
                errorText: _textoErroUsuario,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            child: TextField(
              controller: _controlaCampoSenha,
              obscureText: true, // Hide password
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'senha',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    // verify user
    if (_usuario == _controlaCampoUsuario.text) {
      // verify password
      if (_senha == _controlaCampoSenha.text) {
        // Navigate to home
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        clear(); // Clear fields on incorrect password
      }
    } else {
      setState(() {
        _textoErroUsuario = 'Usuário não encontrado!';
      });
      clear(); // Clear fields on incorrect username
    }
  }

  void clear() {
    _controlaCampoUsuario.clear();
    _controlaCampoSenha.clear();
  }
}
