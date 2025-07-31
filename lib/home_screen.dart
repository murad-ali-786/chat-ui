import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'slider_provider.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('object2');
    return Scaffold(
      appBar: AppBar(title: Text('State Provider Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final temp = ref.watch(
                slider.select((value) => value.showPassword),
              );
              return Center(
                child: InkWell(
                  onTap: () {
                    final provider = ref.read(slider.notifier);
                    provider.state = provider.state.copyWith(
                      showPassword: !temp,
                    );
                  },
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child:
                        temp
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                  ),
                ),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final temp = ref.watch(slider.select((value) => value.slider));

              print('what are you doing');
              print('object3');
              return Column(
                children: [
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red.withValues(alpha: temp),
                    ),
                  ),

                  Slider(
                    value: temp,
                    onChanged: (value) {
                      final provider = ref.read(slider.notifier);
                      provider.state = provider.state.copyWith(slider: value);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
