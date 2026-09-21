import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/features/history/presentation/providers/history_provider.dart';
import 'package:number_trivia/features/history/presentation/widgets/history_tile.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(historyProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Historique')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(historyProvider);
        },
        child: historyAsync.isLoading
            ? Center(child: CircularProgressIndicator())
            : !historyAsync.hasValue
            ? const Center(child: Text('Aucune recherche pour le moment'))
            : ListView.builder(
                itemCount: historyAsync.value!.length,
                itemBuilder: (ctx, index) => HistoryTile(
                  number: historyAsync.value![index].number,
                  text: historyAsync.value![index].text,
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
