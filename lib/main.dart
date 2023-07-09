import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'function.dart';

//

// flutter riverpod
//

//
void main() {
  runApp(ProviderScope(child: MyApp()));
}

final counterProvider = StateNotifierProvider((ref) => Counter());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: ${ref.watch(counterProvider)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => counter.increment(),
              child: Text('Increment'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => counter.decrement(), child: Text('Decrement'))
          ],
        ),
      ),
    );
  }
}
