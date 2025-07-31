import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<Item>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<Item>> {
  TodoNotifier() : super([]);

  void addItem(String name) {
    final item = Item(id: DateTime.now().toString(), value: name);

    state.add(item);
    state = state.toList();
  }

  void editItem(String id, String name) {
    int index = state.indexWhere((element) => element.id == id);

    state[index].value = name;
    state = state.toList();
  }

  void deleteItem(String id) {
    state.removeWhere((element) => element.id == id);
    state = state.toList();
  }
}

class Item {
  String id;
  String value;

  Item({required this.id, required this.value});
}
