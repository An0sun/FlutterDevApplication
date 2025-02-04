/* modèle du compteur, getter qui récup valeur du compteur modèle, méthode incrémentation et décrémentation */
import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel model = CounterModel();

  void incrementCounter() {
    model.incrementCounter();
    notifyListeners();
  }

  void decrementCounter() {
    model.decrementCounter();
    notifyListeners();
  }

  int getCounter() {
    return model.getCounter();
  }
}