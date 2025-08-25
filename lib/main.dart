import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Complex setState Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: ${counterProvider.counter}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              counterProvider.message,
              style: TextStyle(
                fontSize: 18,
                color: counterProvider.isEven ? Colors.blue : Colors.red,
              ),
            ),
            const SizedBox(height: 32),
            if (counterProvider.counter > 5)
              ElevatedButton(
                onPressed: counterProvider.reset,
                child: const Text('Reset Counter'),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
