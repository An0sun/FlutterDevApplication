import 'package:flutter/material.dart';
/*
 * La seconde page de votre app
 */
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seconde page Titre"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur la seconde page !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}