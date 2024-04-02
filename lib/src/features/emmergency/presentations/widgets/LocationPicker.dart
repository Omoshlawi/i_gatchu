import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_gatchu/src/features/common/data/models/maps/place_search_result.dart';
import 'package:i_gatchu/src/features/common/data/services/maps_service.dart';
import 'package:i_gatchu/src/shared/input/Button.dart';
import 'package:i_gatchu/src/shared/styles/input_styles.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class LocationPicker extends HookWidget {
  final void Function(PlaceSearchResult)? onChange;

  const LocationPicker({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    final selected = useState<PlaceSearchResult?>(null);
    GoogleMapController? myController;

    void _onMapCreated(GoogleMapController controller) {
      myController = controller;
    }

    useEffect(() {
      // TODO Fix bug, not anonating to new location because of mycontroller being null
      if (selected.value != null && myController != null) {
        myController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(selected.value!.coordinates.lat,
                  selected.value!.coordinates.lng),
              zoom: 10.0,
            ),
          ),
        );
      }
    }, [selected.value]);

    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.SPACING),
          child: DropdownSearch<PlaceSearchResult>(
            selectedItem: selected.value,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: inputDecoration(
                placeholder: "Location Search",
                prefixIcon: Icons.location_on_rounded,
              ),
            ),
            asyncItems: (String q) async {
              final mapsService = MapsService();
              return q.isEmpty ? [] : await mapsService.searchPlace(q);
            },
            itemAsString: (place) => place.display,
            onChanged: (PlaceSearchResult? data) {
              selected.value = data;
            },
            popupProps: PopupProps.menu(
              title: Padding(
                padding: const EdgeInsets.all(Constants.SPACING),
                child: Center(
                    child: Text(
                  "Search Place",
                  style: theme.textTheme.titleLarge,
                )),
              ),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: inputDecoration(
                  placeholder: "Search ...",
                  prefixIcon: Icons.search,
                ),
              ),
              isFilterOnline: true,
              searchDelay: const Duration(milliseconds: 300),
            ),
          ),
        ),
        if (selected.value != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Constants.SPACING),
              child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(selected.value!.coordinates.lat,
                        selected.value!.coordinates.lng),
                    zoom: 10.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId("marker"),
                      position: LatLng(selected.value!.coordinates.lat,
                          selected.value!.coordinates.lng),
                      infoWindow: InfoWindow(
                        title: selected.value!.display,
                        snippet: selected.value?.name,
                      ),
                    )
                  }),
            ),
          ),
        if (selected.value != null)
          Padding(
            padding: const EdgeInsets.all(Constants.SPACING),
            child: Button(
                title: "Select pick location",
                onPress: () {
                  if (onChange != null) {
                    onChange!(selected.value!);
                  }
                  context.pop();
                }),
          )
      ],
    );
  }
}
