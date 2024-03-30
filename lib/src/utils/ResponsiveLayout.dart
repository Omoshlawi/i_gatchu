import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final double sm;
  final double md;
  final double lg;
  final Widget Function(BuildContext, BoxConstraints)? buildSm;
  final Widget Function(BuildContext, double)? buildMd;
  final Widget Function(BuildContext, double)? buildLg;

  const ResponsiveLayout({
    super.key,
    this.sm = 300,
    this.md = 600,
    this.lg = 800,
    this.buildSm,
    this.buildMd,
    this.buildLg,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (buildMd != null && constraint.maxWidth > sm) {
          return buildSm!(context, constraint);
        }
        if (buildMd != null && constraint.maxWidth > md) {
          return buildSm!(context, constraint);
        }
        if (buildMd != null && constraint.maxWidth > lg) {
          return buildSm!(context, constraint);
        }
        return const Center(
          child: Text(""),
        );
      },
    );
  }
}
