import 'package:flutter/material.dart';

class CounterScreenValueNotifier extends StatefulWidget {
  const CounterScreenValueNotifier({super.key});

  @override
  State<CounterScreenValueNotifier> createState() => _CounterScreenValueNotifierState();
}

class _CounterScreenValueNotifierState extends State<CounterScreenValueNotifier> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<String> _message = ValueNotifier<String>('toque nos botões para alterar o contador');
  final ValueNotifier<Color> _counterColor = ValueNotifier<Color>(Colors.blueAccent);

  void _incrementCounter() {
    _counter.value++;
    _updateMessage();
  }

  void _decrementCounter() {
    _counter.value--;
    _updateMessage();
  }

  void _resetCounter() {
    _counter.value = 0;
      _message.value = 'Contador reiniciado';
      _counterColor.value = Colors.blueAccent;
  }

  void _updateMessage() {
    if (_counter.value == 0) {
      _message.value = 'Contador zerado';
      _counterColor.value = const Color.fromARGB(255, 76, 101, 175);
    } else if (_counter.value > 0) {
      _message.value = 'Contador positivo ${_counter.value}';
      _counterColor.value = const Color.fromARGB(255, 10, 180, 27);
    } else {
      _message.value = 'Contador negativo ${_counter.value}';
      _counterColor.value = const Color.fromARGB(255, 255, 6, 6);
    }
  }

  @override
  void dispose() {
    _counter.dispose();
    _message.dispose();
    _counterColor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador com ValueNotifier'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<Color>(
                valueListenable: _counterColor,
                builder: (context, color, _) => Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ValueListenableBuilder<int>(
                    valueListenable: _counter,
                    builder: (context, value, _) => Text(
                      '$value',
                      style: TextStyle(fontSize: 48, color: color),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<String>(
                valueListenable: _message,
                builder: (context, msg, _) => Text(
                  msg,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}