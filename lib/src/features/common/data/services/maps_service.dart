import 'dart:convert';

import 'package:http/http.dart';
import 'package:i_gatchu/src/features/common/data/models/maps/place_search_result.dart';
import 'package:i_gatchu/src/shared/interfaces/HTTPService.dart';

import '../../../../utils/constants.dart';

class MapsService extends HTTPService {
  Future<List<PlaceSearchResult>> searchPlace(String q) async {
    final response = await call(searchPlace_, q);
    final responseString = await response.stream.bytesToString();
    final Map<String, dynamic> placesData = json.decode(responseString);
    final places = (placesData["results"] as List<dynamic>)
        .map((e) => PlaceSearchResult.fromJson(e))
        .toList();
    return places;
  }

  Future<StreamedResponse> searchPlace_(String q) async {
    final tokenPair = await getCachedToken();
    var headers = {'x-access-token': tokenPair.accessToken};
    var request = Request(
      'GET',
      Uri.parse('${Constants.BASE_URL}/maps/places${getQueryParams({"q": q})}'),
    );
    request.headers.addAll(headers);
    return await request.send();
  }
}
