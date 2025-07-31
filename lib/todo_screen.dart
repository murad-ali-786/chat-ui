import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(title: Text('To Do Screen')),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          ListView.builder(
            itemCount: provider.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = provider[index];
              return provider.isEmpty
                  ? Text('No data found')
                  : ListTile(
                    title: Text(provider[index].value),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            ref
                                .read(todoProvider.notifier)
                                .editItem(item.id, 'this is new value');
                          },
                          child: Text('Update'),
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(todoProvider.notifier).deleteItem(item.id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoProvider.notifier).addItem('murad');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
