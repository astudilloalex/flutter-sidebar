import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sidebar/src/models/sidebar_item.dart';

class SidebarItemWidget extends StatelessWidget {
  const SidebarItemWidget({
    super.key,
    required this.duration,
    required this.item,
    this.sidebarOpen = true,
  });

  final Duration duration;
  final SidebarItem item;
  final bool sidebarOpen;

  @override
  Widget build(BuildContext context) {
    if (item.children != null) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.white),
        child: _ExpansionTile(
          duration: duration,
          item: item,
          sidebarOpen: sidebarOpen,
        ),
      );
    }
    return _ListTile(duration: duration, item: item, sidebarOpen: sidebarOpen);
  }
}

/// The expansion tile.
class _ExpansionTile extends StatefulWidget {
  const _ExpansionTile({
    required this.duration,
    required this.item,
    required this.sidebarOpen,
  });

  final Duration duration;
  final SidebarItem item;
  final bool sidebarOpen;

  @override
  State<_ExpansionTile> createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<_ExpansionTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: Key(widget.item.title),
      title: AnimatedCrossFade(
        duration: widget.duration,
        crossFadeState: widget.sidebarOpen
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: Text(
          widget.item.title,
          style: TextStyle(
            color: widget.item.selected
                ? widget.item.selectedColor
                : widget.item.unselectedColor,
          ),
        ),
        secondChild: const SizedBox.shrink(),
      ),
      leading: SizedBox(
        width: 24.0,
        height: 24.0,
        child: Icon(
          widget.item.icon,
          color: widget.item.selected
              ? widget.item.selectedColor
              : widget.item.unselectedColor,
        ),
      ),
      trailing: !widget.sidebarOpen
          ? const SizedBox.shrink()
          : Transform.rotate(
              angle: expanded ? pi : 0.0,
              child: Icon(
                Icons.expand_more_outlined,
                color: widget.item.selected
                    ? widget.item.selectedColor
                    : widget.item.unselectedColor,
              ),
            ),
      backgroundColor: widget.item.childrenBackground,
      onExpansionChanged: (value) => setState(() => expanded = value),
      children: widget.item.children!
          .map<Widget>(
            (item) => _ListTile(
              duration: widget.duration,
              item: item,
              sidebarOpen: widget.sidebarOpen,
            ),
          )
          .toList(),
    );
  }
}

/// List tile to contain item.
class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.duration,
    required this.item,
    required this.sidebarOpen,
  });

  final Duration duration;
  final SidebarItem item;
  final bool sidebarOpen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AnimatedCrossFade(
        duration: duration,
        crossFadeState:
            sidebarOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Text(
          item.title,
          style: TextStyle(
            color: item.selected ? item.selectedColor : item.unselectedColor,
          ),
        ),
        secondChild: const SizedBox.shrink(),
      ),
      leading: SizedBox(
        width: 24.0,
        height: 24.0,
        child: Icon(
          item.icon,
          color: item.selected ? item.selectedColor : item.unselectedColor,
        ),
      ),
      onTap: item.onTap,
    );
  }
}
