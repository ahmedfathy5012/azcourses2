import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Dart Packages
import 'dart:async';
// Flutter packages
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/ui/widgets/global/circle_button.dart';
// Screens
// Widgets
import '../../widgets/global/location_sheet.dart';
// Providers
// Models
// Helpers
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';
import '../../../helpers/get_services.dart';

class GoogleMapScreen extends StatefulWidget {
  final Function onSaved;

  GoogleMapScreen({this.onSaved});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const LatLng _center = const LatLng(31.037933 , 31.381523);
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  AuthController authController = Get.put(AuthController());


  LatLng loadPostirion = null;

  _onMapCreated(GoogleMapController mapController){
    _controller.complete(mapController);
  }

  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  Widget button(Function function , IconData icon){
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: MAINCOLOR,
      child: Icon(icon,size: 36,),
    );
  }

  _onMapTypePressed(){
    setState(() {
      _currentMapType = _currentMapType== MapType.normal ? MapType.satellite:MapType.normal;

    });
  }

  _onAddMarkerButtonPressed(LatLng position){
    setState(() {
      _lastMapPosition = position;
      loadPostirion = position;
      _markers = [];
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
        )
      );
    });
  }



Future<void> fetchStates()async{
    await authController.fetchStates();
    print(authController.stateLocations[0].title);
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStates();
    _markers.add(
      Marker(
          markerId:  MarkerId(_lastMapPosition.toString()),
          icon: BitmapDescriptor.defaultMarker
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              tiltGesturesEnabled: false,
              zoomControlsEnabled: false,
              markers: Set.from(_markers),
              onCameraMove: _onCameraMove,
              mapType: _currentMapType,
              onTap: (postion){
                 _onAddMarkerButtonPressed(postion);
              },
            ),
//             Padding(
//               padding: EdgeInsets.all(ScreenHelper.screenWidth(context, 16)),
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: ScreenHelper.screenHeight(context, 30),
//                     ),
//                     button(_onMapTypePressed, Icons.map),
//                   ],
//                 ),
//               ),
//             ),
           Positioned(
             bottom: ScreenHelper.screenHeight(context,127),
             right: ScreenHelper.screenWidth(context, 16),
             child: CircleButton(
               isActive: true,
               size: 41,
               iconData: Icons.edit,
               shadowColor: MAINCOLOR.withOpacity(.3),
               buttonColor: MAINCOLOR,
               onPressed: (){
                 GetServices.bottomSheet(
                   child: Material(
                    color:  Colors.transparent,
                       child: LocationSheet(
                         stateLocations : authController.stateLocations,
                         position: loadPostirion,
                       )),
                 );
               },
               blurRadius: 15,
               spreadRadius: 5,
             ),
           ),
          ],

        ),
      ),
    );
  }
}
