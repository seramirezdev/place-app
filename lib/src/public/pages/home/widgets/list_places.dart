import 'package:flutter/material.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/providers/place_provider.dart';
import 'package:places/src/public/pages/home/widgets/place_list_item.dart';
import 'package:places/src/public/pages/widgets/loading.dart';
import 'package:provider/provider.dart';

class ListPlaces extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Place> places = Provider.of<PlaceProvider>(context).places;
    
    if (places.isEmpty) return Loading(message: "Obteniendo lugares...");

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (_, index) {
        return PlaceListItem(place: places[index]);
      },
    );
  }
}
