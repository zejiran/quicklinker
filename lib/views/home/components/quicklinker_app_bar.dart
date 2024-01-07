import 'package:flutter/material.dart';

class QuickLinkerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuickLinkerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('QuickLinker'),
          Text(
            'Shorten your links quickly and easily',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
