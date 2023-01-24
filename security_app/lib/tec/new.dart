// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:security_app/tec/add_image.dart';

//
class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  String loc = "null";
  //
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${loc}"),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            child: _previewImageUrl == null
                ? const Text(
                    'No Location Chosen',
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed:
                    //   final data =
                    //       Provider.of<Auth>(context, listen: false).latitude;
                    //   print(data);
                    //   loc = data.toString();
                    // },
                    () async {
                  final locData = await Location().getLocation();
                  loc = locData.latitude.toString();
                  setState(() {});

                  print(locData.latitude);
                },
                icon: const Icon(Icons.location_on),
                label: const Text('Current Location'),
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddImageScreen.routeName);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add image'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
