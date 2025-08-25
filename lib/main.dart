import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  bool _isEven = true;
  String _message = "Let's start counting!";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isEven = _counter % 2 == 0;
      _message = _isEven ? "Even Number!" : "Odd number!";
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _isEven = true;
      _message = "Counter reset!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex setState Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            Text(
              _message,
              style: TextStyle(
                fontSize: 18,
                color: _isEven ? Colors.blue : Colors.red,
              ),
            ),
            const SizedBox(height: 32),
            if (_counter > 5)
              ElevatedButton(
                onPressed: _resetCounter,
                child: const Text('Reset Counter'),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
