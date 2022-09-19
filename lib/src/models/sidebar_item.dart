import 'package:flutter/material.dart';

/// Sidebar item.
class SidebarItem {
  /// Define a [SidebarItem] class.
  const SidebarItem({
    this.children,
    this.childrenBackground,
    required this.icon,
    this.onTap,
    this.selected = false,
    this.selectedColor,
    required this.title,
    this.unselectedColor,
  });

  /// The children to show under item.
  final List<SidebarItem>? children;

  /// The children container background.
  final Color? childrenBackground;

  /// The icon to show in the sidebar.
  final IconData icon;

  /// Execute action when tap in the sidebar item.
  final VoidCallback? onTap;

  /// If the current item is selected.
  final bool selected;

  /// The selected color of the [icon] and [title].
  final Color? selectedColor;

  /// Title or label of the sidebar item.
  final String title;

  /// The unselected color for the [icon] and [title].
  final Color? unselectedColor;
}
