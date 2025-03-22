import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';
import 'age_input_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final age = ref.watch(ageProvider);
    final status = age == null
        ? 'Please enter your age'
        : age >= 18
            ? 'You are above 18'
            : 'You are below 18';

    return Scaffold(
      appBar: AppBar(title: const Text('Age Status')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AgeInputPage()),
              ),
              child: const Text('Enter Age'),
            ),
          ],
        ),
      ),
    );
  }
}