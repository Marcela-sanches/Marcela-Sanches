import 'package:flutter/material.dart';

class CouterScreen extends StatefulWidget {
  const CouterScreen({super.key});

  @override
  State<CouterScreen> createState() => _CouterScreenState();
}

class _CouterScreenState extends State<CouterScreen> {
  int _counter = 0;
  String _message = 'toque nos botões para alterar o contador';
  Color _counterColor = Colors.blueAccent;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _message = 'Contador reiniciado';
      _counterColor = Colors.blueAccent;
    });
  }

  // void _updateMessage() {
  //   setState(() {
  //     if (_counter == 0) {
  //       _message = 'Contador zerado';
  //       _counterColor = const Color.fromARGB(255, 76, 101, 175);
  //     } else if (_counter > 0) {
  //       _message = 'Contador positivo${_counter}';
  //       _counterColor = const Color.fromARGB(255, 10, 180, 27);
  //     } else {
  //       _message = 'Contador negativo${_counter}';
  //       _counterColor = const Color.fromARGB(255, 255, 6, 6);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador Interativo'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _counterColor.withAlpha(1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: _counterColor, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Valor do Contador:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: _counterColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pinkAccent.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                // DECREMENTANDO
                ElevatedButton.icon(
                  onPressed: _decrementCounter,
                  icon: const Icon(Icons.remove),
                  label: Text('Decrementar')
                ),

                // RESETANDO O CONTADOR
                ElevatedButton.icon(
                  onPressed: _resetCounter,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Resetar'),
                ),

                // INCREMENTANDO
                 ElevatedButton.icon(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.add),
                  label: const Text('Incrementar'),
                ),
               
              ],
            ),

                ],
              )
            )),
      );
  }
}
