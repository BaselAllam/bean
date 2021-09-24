import 'package:bean/models/mainModel.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarAndButtonColor,
            title: TextField(
              controller: searchController,
              onSubmitted: (value) {
                model.searchLocation(value);
              },
            )
          ),
          body: Container(
            child: ScopedModelDescendant(
              builder: (context, child, MainModel model) {
                if(model.isGetCurrentPositionLoading == true) {
                  return Center(child: CircularProgressIndicator());
                }else if(model.isGetSearchLocationLoading == true) {
                  return Center(child: CircularProgressIndicator());
                }else{
                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 12,
                      target: model.position == null ? LatLng(30.005493,31.477898) : 
                      LatLng(model.position!.latitude, model.position!.longitude)
                    ),
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    markers: model.allMarkers,
                  );
                }
              }
            ),
          ),
        );
      },
    );
  }
}
