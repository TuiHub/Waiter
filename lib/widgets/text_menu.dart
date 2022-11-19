import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextMenu extends ConsumerWidget {
  const TextMenu({super.key, required this.children});

  final List<TextMenuItem> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      prototypeItem: TextMenuItem(
        text: '',
        onPressed: () {},
        selected: false,
      ),
      children: children,
    );
  }
}

class TextMenuItem extends ConsumerWidget {
  TextMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.selected,
    this.primaryColor = const Color.fromARGB(255, 79, 148, 188),
  });

  final String text;
  final VoidCallback onPressed;
  final bool selected;
  final Color primaryColor;

  final itemHoverProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = ref.watch(itemHoverProvider);

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          Container(
            width: 3,
            decoration: BoxDecoration(
              color: selected ? Colors.white70 : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(3)),
            ),
          ),
          Container(
            width: 6,
          ),
          Expanded(
            child: AnimatedContainer(
              padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: selected | isHover
                    ? primaryColor
                    : const Color.fromARGB(48, 54, 57, 63),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: InkWell(
                onTap: onPressed,
                onHover: (val) =>
                    ref.read(itemHoverProvider.notifier).state = val,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(text),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
