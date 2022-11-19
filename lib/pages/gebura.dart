import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../helper/navigator.dart';
import '../widgets/split_view.dart';

final geburaList = ['1', '2', '3'];

class GeburaPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SplitView(menu: GeburaPageLeft(), content: GeburaPageRight());
  }
}

class GeburaPageLeft extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for (var pageName in geburaList)
            PageListTile(
              selectedPageName: pageName,
              pageName: pageName,
              onPressed: () => {
                if (isWideScreen(context))
                  {_selectPage(context, ref, pageName)}
                else
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return GeburaPageRight();
                        },
                      ),
                    )
                  }
              },
            ),
        ],
      ),
    );
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile({
    super.key,
    this.selectedPageName,
    required this.pageName,
    this.onPressed,
  });
  final String? selectedPageName;
  final String pageName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // show a check icon if the page is currently selected
      // note: we use Opacity to ensure that all tiles have a leading widget
      // and all the titles are left-aligned
      leading: Opacity(
        opacity: selectedPageName == pageName ? 1.0 : 0.0,
        child: const Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}

class GeburaPageRight extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(geburaProvider.state).state;
    return Scaffold(
      body: Center(
        child: Text("current page is $number"),
      ),
    );
  }
}

void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
  if (ref.read(geburaProvider.state).state != pageName) {
    ref.read(geburaProvider.state).state = pageName;
  }
}

final geburaProvider = StateProvider<String>((ref) {
  return "";
});
