import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_practice/shared_state.dart';

final stateProvider = StateNotifierProvider<SharedStateNotifier, SharedState>(
  (ref) => SharedStateNotifier(),
);

class TopPage extends ConsumerStatefulWidget {
  const TopPage({super.key});

  @override
  ConsumerState<TopPage> createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<TopPage> {
  @override
  void initState() {
    super.initState();
    ref.read(stateProvider.notifier).increment();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(state.name),
      ),
      body: Center(
        child: Text(
          '${state.age}',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(stateProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
