import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.title});

  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final Box _boxAccounts = Hive.box("accounts");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cadastro"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Container(
                child: Center(
                  child: Image.asset('assets/images/logo.png', scale: 2.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira o email.';
                    } else if (_boxAccounts.containsKey(value)) {
                      return 'Email já registrado.';
                    } else if (!(value.contains('@') && value.contains('.'))) {
                      return 'Email Inválido';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "Senha"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira a senha.';
                    } else if (value.length < 8) {
                      return 'A senha precisa ter no mínimo 8 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "Confirmar Senha"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira a senha.';
                    } else if (value != passwordController.text) {
                      return 'A senha não corresponde.';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Registre-se'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _boxAccounts.put(
                          emailController.text,
                          confirmPasswordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: 200,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content:
                                const Text("Registro realizado com sucesso"),
                          ),
                        );

                        _formKey.currentState?.reset();

                        Navigator.pop(context);
                      }
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Já possui uma conta?'),
                  TextButton(
                    child: const Text(
                      'Login',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
