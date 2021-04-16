import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:prescription/models/doctor.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:prescription/models/doctor_details_model.dart';

class Output extends StatefulWidget {
  Map prescriptionData;
  DoctorDetailsModel doctorDetails;
  GlobalKey globalKey;

  Output({this.prescriptionData, this.doctorDetails, this.globalKey});
  @override
  _OutputState createState() => _OutputState(prescriptionData: prescriptionData, doctorDetails:doctorDetails, globalKey: globalKey);
}

class _OutputState extends State<Output> {
  String name;
  String age;
  String day;
  String prescription;
  GlobalKey globalKey;
  Map prescriptionData;
  DoctorDetailsModel doctorDetails;
  Doctor doc1;
  Doctor doc2;
  int count;


  _OutputState({this.prescriptionData, this.doctorDetails, this.globalKey}){
    name = prescriptionData['name'];
    age = prescriptionData['age'];
    day = prescriptionData['day'];
    prescription = prescriptionData['prescription'];
    doc1 = doctorDetails.doc1;
    doc2 = doctorDetails.doc2;
    count = doctorDetails.count;
  }

  
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Medical Center',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        doctorDetails.address,
                        style: TextStyle(
                          fontSize: 14,
                        )
                      )
                    ],
                  ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            doc1.name,
                          ),
                          Text(
                            doc1.qualification,
                          ),
                          Text(
                            'SLMC: ' + doc1.slmc,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 55),
                    count == 2 ?
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(doc2.name),
                          Text(
                            doc2.qualification,
                          ),
                          Text(
                            'SLMC: ' + doc2.slmc,
                          ),
                        ],
                      ),
                    ): Container(),
                  ],
                ),
              ),
              Divider(
                height: 30,
                color: Colors.grey[600],indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Text(
                      "Name:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Text(
                      "Age:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                        age,
                        style: TextStyle(
                          fontSize: 16,
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Text(
                      "Date:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                        day,
                        style: TextStyle(
                          fontSize: 16,
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    Text(
                      "Prescripton",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 15.0),
                  Text(
                    prescription,
                      style: TextStyle(
                        fontSize: 16,
                      )
                  ),
                ],
              ),

            ],

          ),
        ),
      ),
    );
  }
}

