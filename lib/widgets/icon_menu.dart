import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconMenu extends ConsumerWidget {
  const IconMenu({super.key, required this.children});

  final List<IconMenuItem> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 72,
      child: Ink(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 32, 34, 37),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: children,
        ),
      ),
    );
  }
}

class IconMenuItem extends ConsumerWidget {
  IconMenuItem({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected,
    this.primaryColor = const Color.fromARGB(255, 79, 148, 188),
    this.containerSize = 72,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool selected;
  final Color primaryColor;
  final double containerSize;

  final itemHoverProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = ref.watch(itemHoverProvider);

    return SizedBox(
      width: containerSize,
      height: containerSize,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(12),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: selected | isHover
              ? primaryColor
              : const Color.fromARGB(255, 54, 57, 63),
          borderRadius:
              BorderRadius.all(Radius.circular(selected | isHover ? 12 : 24)),
        ),
        child: InkWell(
          onTap: onPressed,
          onHover: (val) => ref.read(itemHoverProvider.notifier).state = val,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(
                icon,
                color: selected | isHover ? Colors.white : primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
