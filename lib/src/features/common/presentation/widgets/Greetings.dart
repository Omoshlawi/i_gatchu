import 'package:flutter/material.dart';
import 'package:i_gatchu/src/shared/display/AppCard.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class Greetings extends StatelessWidget {
  final String? image;
  final String name;

  const Greetings({super.key, this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final headerHeight = screenSize.height * 0.28;
    final radius = screenSize.width * 0.12;

    return Container(
      margin: EdgeInsets.only(bottom: headerHeight * 0.3),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: headerHeight,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
          ),
          Positioned(
            bottom: -(headerHeight * 0.25),
            height: headerHeight * 1.25,
            width: screenSize.width * 0.89,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello 👋,",
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: AppCard(
                    color: theme.colorScheme.onPrimary,
                    variant: CardVariant.ELEVETED,
                    child: Container(
                      padding: const EdgeInsets.all(Constants.SPACING),
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            AppCard(
                              child: Padding(
                                padding: const EdgeInsets.all(Constants.SPACING),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/report-incidence.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                    const Text("Report Incidence"),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                            AppCard(
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(Constants.SPACING),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/emergency-call.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                    const Text("Emergency Call"),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ), AppCard(
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(Constants.SPACING),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/incidents-report.png",
                                      width: 80,
                                      height: 80,
                                    ),
                                    const Text("Emergency alerts"),
                                  ],
                                ),
                              ),
                              onTap: () {},
                            ), AppCard(
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(Constants.SPACING),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/psychological-help.png",
                                        width: 80,
                                        height: 80,
                                      ),
                                      const Text("Psycho social support"),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
