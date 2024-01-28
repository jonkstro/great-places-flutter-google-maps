import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/constantes.dart';
import 'package:great_places/utils/db_util.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:great_places/widgets/location_input.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData(Constantes.tbName);
    _items = dataList
        .map((item) => Place(
              id: item['id'] as String,
              title: item['title'] as String,
              image: File(item['image'] as String),
              location: PlaceLocation(
                item['adress'] as String,
                latitude: item['latitude'] as double,
                longitude: item['longitude'] as double,
              ),
            ))
        .toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(
    String title,
    File image,
    LatLng position,
  ) async {
    String address = await LocationUtil.getAdressFrom(position);
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        address,
        latitude: position.latitude,
        longitude: position.longitude,
      ),
    );

    _items.add(newPlace);
    // Adicionar no SQLite
    DbUtil.insert(Constantes.tbName, {
      'id': newPlace.id,
      'title': newPlace.title,
      // Vamos adicionar só o path da imagem que já tá salvo na pasta do projeto
      'image': newPlace.image.path,
      'lat': position.latitude,
      'lng': position.longitude,
      'address': address,
    });
    notifyListeners();
  }
}
