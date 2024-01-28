import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/utils/constantes.dart';
import 'package:http/http.dart' as http;

const String zoom = '15';

class LocationUtil {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center$latitude,$longitude=&zoom=$zoom&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${Constantes.googleApiKey}';
    // return 'https://maps.googleapis.com/maps/api/staticmap?center$latitude,$longitude=&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${Constantes.googleApiKey}&signature=YOUR_SIGNATURE';
  }

  // Fazer o ReverseGeocoding (pegar endereço pela coordenada)
  static Future<String> getAdressFrom(LatLng position) async {
    // Exemplo:
    // https://maps.googleapis.com/maps/api/geocode/json?latlng=-2.917810554497675,-41.73103328794241&key=AIzaSyCp2nFGjtl3EOJSgiFaUkp05%E2%80%A6
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${Constantes.googleApiKey}';
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body)['results'][0]['formatted_address'];
  }
}
