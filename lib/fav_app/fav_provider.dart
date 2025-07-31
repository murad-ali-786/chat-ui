import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice1/fav_app/fav_state.dart';

final favProvider = StateNotifierProvider<FavNotifier, FavState>((ref) {
  return FavNotifier();
});

class FavNotifier extends StateNotifier<FavState> {
  FavNotifier() : super(FavState());

  void addItem() {
    List<FavItem> itemList = [
      FavItem(id: 'a101', name: 'murad', isFav: true),
      FavItem(id: 'b202', name: 'ahsan', isFav: false),
      FavItem(id: 'c303', name: 'ali', isFav: true),
      FavItem(id: 'd404', name: 'zara', isFav: false),
      FavItem(id: 'e505', name: 'usman', isFav: true),
      FavItem(id: 'f606', name: 'sana', isFav: false),
      FavItem(id: 'g707', name: 'ayesha', isFav: true),
      FavItem(id: 'h808', name: 'fahad', isFav: false),
      FavItem(id: 'i909', name: 'amna', isFav: true),
      FavItem(id: 'j010', name: 'hassan', isFav: false),
    ];

    state = state.copyWith(allItemList: itemList, filterItemList: itemList);
  }

  void filterItem(String search) {
    state = state.copyWith(
      filterItemList: _filterList(state.allItemList, search),
    );
  }

  List<FavItem> _filterList(List<FavItem> allItem, String search) {
    if (search.isEmpty) {
      return allItem;
    }
    return allItem
        .where(
          (element) =>
              element.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
  }
}

class FavItem {
  final String id;
  final String name;
  final bool isFav;

  FavItem({required this.id, required this.name, required this.isFav});
}
