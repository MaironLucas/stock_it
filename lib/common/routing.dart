import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_it/common/general_provider.dart';
import 'package:stock_it/presentation/home/home_page.dart';

const _slash = '/';
const _homePage = 'home';

const _homePath = _slash + _homePage;

final goRouterProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    final analyticsObserver = ref.watch(analyticsObserverProvider);
    return GoRouter(
      initialLocation: _homePath,
      observers: [
        analyticsObserver,
      ],
      routes: [
        GoRoute(
          path: _homePath,
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  },
);
