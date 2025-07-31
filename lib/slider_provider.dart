import 'package:flutter_riverpod/flutter_riverpod.dart';

final slider = StateProvider((ref) {
  return SliderState(showPassword: false, slider: 0.1);
});

class SliderState {
  final bool showPassword;
  final double slider;

  SliderState({required this.showPassword, required this.slider});

  SliderState copyWith({bool? showPassword, double? slider}) {
    return SliderState(
      showPassword: showPassword ?? this.showPassword,
      slider: slider ?? this.slider,
    );
  }
}
