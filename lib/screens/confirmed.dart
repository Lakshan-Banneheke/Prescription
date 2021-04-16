import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription/bloc/doctor_details_bloc.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/widgets/output.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  Map data;
  Map prescription;
//  Map doctorsDetails;

  GlobalKey _globalKey = new GlobalKey();
  var byteData;
  int _currentIndex = 1;

  Future<void> _capturePng() async {
    return new Future.delayed(const Duration(milliseconds: 20), () async {
      try {
        print('inside');
        RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
        var pngBytes = byteData.buffer.asUint8List();
        var bs64 = base64Encode(pngBytes);
        print(pngBytes);
        print(bs64);
        setState(() {});
      } catch (e) {
        print(e);
      }
    });
  }

  Future<void> _shareImage() async {
    try {
      await _capturePng();
      final ByteData bytes = byteData;
      await Share.file(
          'esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png');
    } catch (e) {
      print('error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
//    doctorsDetails = data['doctorsDetails'];
    prescription = data['prescription'];

//      data = {
//        'name': 'Fluffy',
//        'age': '20',
//        'day': '10/07/2020',
//        'prescription': 'skdjfnsdjkfnsdjkfnsdjfsdkjn'
//      };

        return Scaffold(
          appBar: AppBar(
            title: Text('Prescription'),
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add, color: Colors.white,),
                label: Text(
                  'New',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/newPrescription');
                },
                color: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ],
          ),
          body: Container(
              child: BlocBuilder<DoctorDetailsBloc, DoctorDetailsModel>(
                  builder:(context, doctorDetailsModel) {
                    return Output(prescriptionData: prescription, doctorDetails: doctorDetailsModel, globalKey:_globalKey);
                  }
              )

          ),
          bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.fixed,
//            backgroundColor: Colors.grey,
            iconSize: 30,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                title: Text('Edit'),
//                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.share),
                title: Text('Share'),
//                backgroundColor: Colors.white,
              ),
            ],
            onTap: (index) async {
              setState(() {
                _currentIndex = index;
              });
              if (index == 0) {
                Navigator.pop(context);
              } else {
                await _shareImage();
              }
            },
          ),
        );
      }
  }

