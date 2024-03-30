import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:i_gatchu/src/features/emmergency/data/providers/support_service_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i_gatchu/src/shared/display/AppCard.dart';
import '../../../../utils/constants.dart';

class SupportServices extends HookConsumerWidget {
  const SupportServices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportServiceAsync = ref.watch(supportServiceProvider);
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return supportServiceAsync.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.SPACING),
            child: Text(
              "Supported emergency services",
              style: theme.textTheme.titleSmall,
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: screenSize.height * 0.10,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
            items: data
                .where((artAppointment) => // Filter only upcoming appointments
                    DateTime.parse(artAppointment.createdAt)
                        .difference(DateTime.now())
                        .inDays >=
                    0)
                .map(
              (supportService) {
                return Builder(
                  builder: (BuildContext context) {
                    return AppCard(
                      color: theme.colorScheme.onPrimary,
                      variant: CardVariant.ELEVETED,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "${Constants.BASE_URL}/${supportService.image}",
                            ),
                            const SizedBox(width: Constants.SPACING),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(supportService.name, maxLines: 1),
                                Text(
                                  supportService.email,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.labelSmall,
                                  maxLines: 1,
                                ),
                                Text(
                                  supportService.phoneNumber,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleSmall,
                                  maxLines: 1,
                                ),
                              ],
                            )
                          ]), /*ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(
                            Constants.SPACING,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.background,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                Constants.ROUNDNESS,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "${Constants.BASE_URL}/${supportService.image}",
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        title: Text(supportService.name, maxLines: 1),
                        titleTextStyle: theme.textTheme.titleSmall
                            ?.copyWith(overflow: TextOverflow.ellipsis),
                        subtitle: Text(
                            "${supportService.email} | ${supportService.phoneNumber}"),
                        subtitleTextStyle: theme.textTheme.bodySmall,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat("d").format(
                                  DateTime.parse(supportService.createdAt)),
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat("MMM").format(
                                  DateTime.parse(supportService.createdAt)),
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )*/
                    );
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
      error: (error, _) => Container(),
      loading: () => const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Loading services "), CircularProgressIndicator()]),
      ),
    );
  }
}
