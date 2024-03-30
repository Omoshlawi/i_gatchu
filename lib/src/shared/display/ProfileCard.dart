import 'package:flutter/material.dart';
import 'package:i_gatchu/src/shared/display/AppAvatar.dart';

class ProfileCard extends StatelessWidget {
  final double height;
  final String? coverPhoto;
  final Widget Function(BuildContext, dynamic)? buildItem;
  final List<dynamic> items;
  final BoxDecoration? bodyContainerDecoration;
  final EdgeInsetsGeometry? bodyContainerPadding;
  final EdgeInsetsGeometry? bodyContainerMargin;
  final Widget? header;
  final double headerFactor;
  final String? image;
  final IconData icon;

  const ProfileCard({super.key,
    this.height = 600,
    this.coverPhoto,
    this.buildItem,
    this.items = const [],
    this.bodyContainerDecoration,
    this.bodyContainerMargin,
    this.bodyContainerPadding,
    this.header,
    this.headerFactor = 0.2,
    this.image,
    this.icon=Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerHeight = height * headerFactor;
    return Column(
      children: [
        Container(
          height: headerHeight,
          decoration: bodyContainerDecoration,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        backgroundBlendMode: BlendMode.darken,
                        image: coverPhoto != null ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            coverPhoto!,
                          ),
                        ) : null,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              AppAvatar(
                radius: headerHeight * 0.42,
                alt: Icon(
                  icon,
                  size: headerHeight * 0.3,
                ),
                image:image,
              ),
            ],
          ),
        ),
        if(header != null)
          header!,
        if (buildItem != null)
          Expanded(
            child: Container(
              decoration: bodyContainerDecoration,
              padding: bodyContainerPadding,
              margin: bodyContainerMargin,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    buildItem!(context, items[index]),
              ),
            ),
          )
      ],
    );
  }
}
