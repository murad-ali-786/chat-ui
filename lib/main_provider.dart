import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProvider = StateNotifierProvider<MainState, MainStateModel>((ref) {
  return MainState();
});

class MainState extends StateNotifier<MainStateModel> {
  MainState() : super(MainStateModel(query: '', value: false));

  void search(String query) {
    state = state.copyWith(query: query);
  }

  void turnSwitch(bool value) {
    state = state.copyWith(value: value);
  }
}

/// Define the state model
class MainStateModel {
  final String query;
  final bool value;

  MainStateModel({required this.query, required this.value});

  // copyWith method
  MainStateModel copyWith({String? query, bool? value}) {
    return MainStateModel(
      query: query ?? this.query,
      value: value ?? this.value,
    );
  }
}
