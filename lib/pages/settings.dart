import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/split_view.dart';
import '../widgets/text_menu.dart';
import 'settings/app.dart';
import 'settings/user.dart';

final settings = <String, WidgetBuilder>{
  'User': (_) => UserSettingPage(),
  'App': (_) => AppSettingPage(),
};

class SettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageName = ref.watch(selectedPageNameProvider);
    final selectedPageLeftBuilder = ref.watch(selectedPageBuilderProvider);

    return SplitView(
      menu: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: TextMenu(
            children: [
              for (var setting in settings.keys)
                TextMenuItem(
                  text: setting,
                  onPressed: () => _selectPage(context, ref, setting),
                  selected: setting == selectedPageName,
                ),
            ],
          ),
        ),
      ),
      content: selectedPageLeftBuilder(context),
    );
  }
}

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if (ref.read(selectedPageNameProvider) != pageName) {
    ref.read(selectedPageNameProvider.notifier).state = pageName;
  }
}

final selectedPageNameProvider = StateProvider<String>((ref) {
  return settings.keys.first;
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageNameProvider);
  return settings[selectedPageKey]!;
});
