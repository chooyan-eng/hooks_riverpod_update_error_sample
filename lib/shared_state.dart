import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedState {
  final String name;
  final int age;

  SharedState(this.name, this.age);

  // copywith method
  SharedState copyWith({String? name, int? age}) {
    return SharedState(
      name ?? this.name,
      age ?? this.age,
    );
  }
}

class SharedStateNotifier extends StateNotifier<SharedState> {
  SharedStateNotifier() : super(SharedState('Flutter', 0));

  void increment() {
    state = state.copyWith(age: state.age + 1);
  }
}
