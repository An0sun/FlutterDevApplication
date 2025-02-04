class CounterModel{
  int counter;
  CounterModel ({this.counter = 0});

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
      counter--;
  }

  int getCounter() {
    return counter;
  }
}