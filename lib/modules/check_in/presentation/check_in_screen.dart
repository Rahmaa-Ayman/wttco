import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wttco/core/uitilites/constances.dart';
import 'package:wttco/core/widget/loading_widget.dart';
import 'package:wttco/core/widget/snack_bar.dart';

import 'package:wttco/modules/check_in/widget/button/primary_button.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final CameraPosition _kGooglePlex = const CameraPosition(
    target: AppConstancies.officeLocation,
    zoom: 14.4746,
  );

  GoogleMapController? _controller;
  String mapStyle = '';
  final Set<Marker> _markers = <Marker>{};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/style/map.json').then((String value) {
      mapStyle = value;
    });
  }

  void addMarker() {
    Marker m = const Marker(
      markerId: MarkerId("office"),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: "Office", snippet: "WTTCO"),
      position: AppConstancies.officeLocation,
    );
    setState(() {
      _markers.add(m);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
              _controller!.setMapStyle(mapStyle);
              addMarker();
            },
          ),
          Positioned(
              bottom: 40,
              child: isLoading
                  ? const LoadingWidget()
                  : PrimaryButton(
                      text: "Check in",
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        Position? currentLocation;
                        try {
                          LocationPermission permission = await Geolocator.requestPermission();
                          currentLocation = await Geolocator.getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high);
                          double distance = Geolocator.distanceBetween(
                              AppConstancies.officeLocation.latitude,
                              AppConstancies.officeLocation.longitude,
                              currentLocation.latitude,
                              currentLocation.longitude);
                          if(currentLocation.isMocked){
                            showSnackBar(
                              context: context,
                              message: 'Fake location isn\'t not allowed , please use real location',
                            );
                          }else{
                            if (distance <= 500) {
                              showSnackBar(
                                context: context,
                                message: 'CheckIn Successfully',
                              );
                            } else {
                              showSnackBar(
                                context: context,
                                message:
                                'You\'re out of the available range (500m)',
                              );
                            }
                          }

                          print(distance.toString());
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          showSnackBar(
                            context: context,
                            message: 'Please Enable Your Location',
                          );
                          await Geolocator.openAppSettings();
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ))
        ],
      ),
    );
  }
}
