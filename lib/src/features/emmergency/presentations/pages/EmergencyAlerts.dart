import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i_gatchu/src/features/emmergency/data/providers/emergency_alertprovider.dart';
import 'package:i_gatchu/src/shared/display/AppCard.dart';
import 'package:i_gatchu/src/shared/display/AppSearch.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/utils/constants.dart';
import 'package:intl/intl.dart';

class EmergencyAlerts extends StatefulWidget {
  const EmergencyAlerts({super.key});

  @override
  State<EmergencyAlerts> createState() => _EmergencyAlertsState();
}

class _EmergencyAlertsState extends State<EmergencyAlerts> {
  late GoogleMapController myController;
  late String _search;

  final LatLng _center = const LatLng(-1.0986984, 36.9666969);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Emergency Incidents"),
        backgroundColor: theme.primaryColor,
      ),
      body: Consumer(builder: (context, ref, child) {
        final alerts = ref.watch(emergencyAlertProvider);

        return alerts.when(
          data: (data) => Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 10.0,
                ),
                markers: data
                    .map(
                      (e) => Marker(
                        markerId: MarkerId(e.id!),
                        position: LatLng(
                          e.location.lat,
                          e.location.lng,
                        ),
                        infoWindow: InfoWindow(
                            title: e.title,
                            snippet: e.location.address,
                            onTap: () {
                              showModalBottomSheet(
                                // isScrollControlled: true,
                                context: context,
                                builder: (context) => FractionallySizedBox(
                                  heightFactor: 0.75,
                                  widthFactor: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        Constants.SPACING * 2),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            e.title,
                                            style:
                                                theme.textTheme.headlineLarge,
                                          ),
                                          const SizedBox(
                                              height: Constants.SPACING),
                                          ExpansionTile(
                                            title: const Text("Description"),
                                            children: [
                                              Text(
                                                e.description ?? "",
                                                style:
                                                    theme.textTheme.titleLarge,
                                              )
                                            ],
                                          ),
                                          Container(
                                            color: theme.colorScheme
                                                .onTertiaryContainer,
                                            width: double.infinity,
                                            height: 1,
                                          ),
                                          const SizedBox(
                                              height: Constants.SPACING * 2),
                                          Container(
                                            color: theme.colorScheme.background,
                                            margin: const EdgeInsets.only(
                                                top: Constants.SPACING),
                                            child: ListTile(
                                              leading: const Icon(Icons.person),
                                              title: const Text("Reported by"),
                                              subtitle: Text(e.user.username),
                                            ),
                                          ),
                                          Container(
                                            color: theme.colorScheme.background,
                                            margin: const EdgeInsets.only(
                                                top: Constants.SPACING),
                                            child: ListTile(
                                              leading: const Icon(
                                                  Icons.calendar_month),
                                              title:
                                                  const Text("Date of event"),
                                              subtitle: Text(DateFormat(
                                                      "EEE dd MMM yyy KK:mm a")
                                                  .format(DateTime.parse(
                                                      e.createdAt))),
                                            ),
                                          ),
                                          const SizedBox(
                                              height: Constants.SPACING * 2),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: e.images
                                                  .map((e) => AppCard(
                                                        child: Image.network(
                                                          "${Constants.BASE_URL}/${e}",
                                                          height: 200,
                                                          width: MediaQuery.of(context).size.width*0.60,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                          const SizedBox(
                                              height: Constants.SPACING * 2),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                    .toSet(),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppSearch(),
                ),
              ),
            ],
          ),
          error: (error, _) => Center(child: Text(error.toString())),
          loading: () => Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Getting emergency incidents",
                  style: theme.textTheme.titleLarge),
              const SizedBox(height: Constants.SPACING * 2),
              const CircularProgressIndicator(),
            ],
          )),
        );
      }),
    );
  }
}
