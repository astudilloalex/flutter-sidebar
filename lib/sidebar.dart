library sidebar;

import 'package:flutter/material.dart';
import 'package:sidebar/src/models/sidebar_item.dart';
import 'package:sidebar/src/sidebar_item_widget.dart';

export 'src/models/sidebar_item.dart';

/// Widget to draw a sidebar in the screen.
class Sidebar extends StatefulWidget {
  /// Define a [Sidebar] widget.
  const Sidebar({
    super.key,
    this.collapsed = false,
    this.collapseWidth = 60.0,
    this.color,
    this.duration = const Duration(milliseconds: 300),
    this.header,
    this.items = const <SidebarItem>[],
    this.openWidth = 270.0,
    this.separator,
    this.showToggleButton = true,
    this.toggleColor,
  });

  /// If the sidebar is collapsed.
  ///
  /// Default is false.
  final bool collapsed;

  /// The with when sidebar is collapsed.
  final double collapseWidth;

  /// The color of the sidebar.
  final Color? color;

  /// The duration of animation when open or collapse the sidebar.
  final Duration duration;

  /// The header of the sidebar.
  final Widget? header;

  /// The items to show in the sidebar.
  final List<SidebarItem> items;

  /// The width when sidebar is opened.
  final double openWidth;

  /// The separator between [items].
  final Widget? separator;

  /// If show collapse button in the footer.
  ///
  /// Default is true.
  final bool showToggleButton;

  /// The toggle button color.
  final Color? toggleColor;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool _collapsed = false;

  @override
  void initState() {
    super.initState();
    _collapsed = widget.collapsed;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: widget.color,
      duration: widget.duration,
      height: MediaQuery.of(context).size.height,
      width: _collapsed ? widget.collapseWidth : widget.openWidth,
      child: Column(
        children: [
          if (widget.header != null) widget.header!,
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                return SidebarItemWidget(
                  duration: widget.duration,
                  item: widget.items[index],
                  sidebarOpen: !_collapsed,
                );
              },
              separatorBuilder: (_, index) {
                if (widget.separator != null) return widget.separator!;
                return const SizedBox.shrink();
              },
              itemCount: widget.items.length,
            ),
          ),
          if (widget.showToggleButton)
            Align(
              alignment: _collapsed ? Alignment.center : Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  setState(() => _collapsed = !_collapsed);
                },
                splashRadius: 20.0,
                icon: Icon(
                  _collapsed
                      ? Icons.arrow_forward_ios_outlined
                      : Icons.arrow_back_ios_new_outlined,
                ),
                color: widget.toggleColor,
              ),
            )
        ],
      ),
    );
  }
}
