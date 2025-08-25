# Flutter Counter App with Provider

This example demonstrates how to use the Provider package for state management in a Flutter counter app.

## 1. Add Provider to `pubspec.yaml`

```
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
```

---

## 2. Create `lib/counter_provider.dart`

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  bool _isEven = true;
  String _message = "Let's start counting!";

  int get counter => _counter;
  bool get isEven => _isEven;
  String get message => _message;

  void increment() {
    _counter++;
    _isEven = _counter % 2 == 0;
    _message = _isEven ? "Even Number!" : "Odd number!";
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    _isEven = true;
    _message = "Counter reset!";
    notifyListeners();
  }
}
```

---

## 3. Update `lib/main.dart`

```dart
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
      appBar: AppBar(title: const Text('Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: counterProvider.counter}', style: const TextStyle(fontSize: 24)),
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
```

---

## 4. Run the App

- Run `flutter pub get` to install dependencies.
- Start your app as usual.

---

**You now have a Flutter counter app using Provider for state management!**
