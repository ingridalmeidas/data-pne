import 'package:flutter/material.dart';

import 'meta.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sobre'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //const SizedBox(height: 20),
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 30, right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "O que é o PNE?",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "O Plano Nacional de Educação (PNE) determina 20 metas para a educação brasileira, a serem cumpridas ao longo de dez anos, a partir de junho de 2014. Todos os entes federados (municípios, estados e distrito federal) devem possuir um plano subnacional de educação, alinhado ao PNE, porém respeitando as características específicas do seu contexto. Os entes federados devem continuamente monitorar e avaliar seus planos, e atuar em regime de colaboração, visando ao alcance das metas e à implementação das estratégias do PNE.",
                      ),
                      const SizedBox(height: 20),
                      Image.asset('assets/images/2.jpg'),
                    ],
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 30, right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Meta 3",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Universalizar, até 2016, o atendimento escolar para toda a população de 15 (quinze) a 17 (dezessete) anos e elevar, até o final do período de vigência deste PNE, a taxa líquida de matrículas no ensino médio para 85% (oitenta e cinco por cento).",
                      ),
                      const SizedBox(height: 20),
                      //Image.asset('assets/images/target.png', scale: 1.5),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: FilledButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black, // Text Color
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: const Text('Acompanhar Meta 3'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Meta()),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
