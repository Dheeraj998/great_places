import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCUrrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
          alignment: Alignment.center,
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: _getCUrrentUserLocation,
                icon: Icon(Icons.location_off),
                label: Text('current location')),
            SizedBox(
              width: 5,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text('Select on map'))
          ],
        )
      ],
    );
  }
}
