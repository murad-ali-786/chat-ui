import 'package:practice1/fav_app/fav_provider.dart';

class FavState {
  final List<FavItem> allItemList;
  final List<FavItem> filterItemList;
  final String searchQuery;

  FavState({
    this.allItemList = const [],
    this.filterItemList = const [],
    this.searchQuery = '',
  });

  FavState copyWith({
    List<FavItem>? allItemList,
    List<FavItem>? filterItemList,
    String? searchQuery,
  }) {
    return FavState(
      allItemList: allItemList ?? this.allItemList,
      filterItemList: filterItemList ?? this.filterItemList,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
