import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/account.dart';
import 'pages/gebura.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'widgets/circular_reveal_route.dart';
import 'widgets/icon_menu.dart';

final routes = <String, WidgetBuilder>{
  'Home': (_) => const HomePage(title: 'Flutter Demo Home Page'),
  'Login': (_) => AccountPage(),
  'Gebura': (_) => GeburaPage(),
  'Setting': (_) => SettingPage(),
};

final icons = <String, IconData>{
  'Home': Icons.home,
  'Login': Icons.face,
  'Setting': Icons.settings,
  'Gebura': Icons.casino,
};

final mainList = ['Home', 'Gebura'];
final bottomList = ['Setting'];

class AppMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageName = ref.watch(selectedPageNameProvider);
    return Scaffold(
      body: Column(
        children: [
          IconMenuItem(
            icon: icons['Login']!,
            selected: false,
            onPressed: () => Navigator.of(context).push(
              CircularRevealRoute(
                opaque: false,
                center: const Offset(48, 48),
                sizeRatio: 0.7,
                transitionDuration: const Duration(milliseconds: 200),
                builder: (context) {
                  return AccountPage();
                },
              ),
            ),
          ),
          Expanded(
            child: IconMenu(
              children: [
                for (var pageName in mainList)
                  IconMenuItem(
                    icon: icons[pageName]!,
                    selected: pageName == selectedPageName,
                    onPressed: () => _selectPage(context, ref, pageName),
                  )
              ],
            ),
          ),
          for (var pageName in bottomList)
            IconMenuItem(
              icon: icons[pageName]!,
              selected: pageName == selectedPageName,
              onPressed: () => _selectPage(context, ref, pageName),
            )
        ],
      ),
    );
  }
}

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if (ref.read(selectedPageNameProvider) != pageName) {
    ref.read(selectedPageNameProvider.notifier).state = pageName;
  }
}

final selectedPageNameProvider = StateProvider<String>((ref) {
  return routes.keys.first;
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageNameProvider);
  return routes[selectedPageKey]!;
});
