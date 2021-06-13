import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar(
      {Key? key, required this.selectedIndex, required this.onItemPressed})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: AppLocalization.of(context).map,
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          backgroundColor: Colors.white,
          label: AppLocalization.of(context).location,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      onTap: onItemPressed,
    );
  }
}
