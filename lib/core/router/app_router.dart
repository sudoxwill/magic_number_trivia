import 'package:go_router/go_router.dart';

import '../../features/history/presentation/pages/history_page.dart';
import '../../features/number_trivia/presentation/pages/number_trivia_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const NumberTriviaPage(),
    ),

    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const HistoryPage(),
    ),
  ],
);
