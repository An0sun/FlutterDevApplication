import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/counter_view_model.dart';
import '../widgets/custom_counter.dart';

/*
 * Page d'accueil et son état mutable
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Ici, les méthodes et fonctions qui font varier l'état de votre page d'accueil
  // Fonction build qui construit l'UI associé à l'état de votre page
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: CustomCounter(),
    ); // ChangeNotifierProvider
  }
}