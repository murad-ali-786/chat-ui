import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'fav_provider.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(favProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Fav Item Provider')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'search For Anything'),
            onChanged: (value) {
              ref.read(favProvider.notifier).filterItem(value);
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: provider.filterItemList.length,
              itemBuilder: (context, index) {
                final data = provider.allItemList[index];
                return ListTile(
                  title: Text(data.name),

                  trailing:
                      data.isFav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_outline),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favProvider.notifier).addItem();
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
