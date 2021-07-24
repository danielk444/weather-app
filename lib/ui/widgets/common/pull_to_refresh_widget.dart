import 'package:flutter/material.dart';

class PullToRefreshWidget extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;

  PullToRefreshWidget({required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxHeight: constraints.maxHeight),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
