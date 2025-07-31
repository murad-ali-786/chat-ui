import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/main_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('object1');
    return Scaffold(
      appBar: AppBar(title: const Text('State Notifier Provider')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Write something'),
              onChanged: (value) {
                ref.read(mainProvider.notifier).search(value);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print('object2');

                final temp = ref.watch(
                  mainProvider.select((value) => value.query),
                );
                return Text(temp);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print('object3');

                final temp = ref.watch(
                  mainProvider.select((value) => value.value),
                );
                return Switch(
                  value: temp,
                  onChanged: (value) {
                    ref.read(mainProvider.notifier).turnSwitch(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
