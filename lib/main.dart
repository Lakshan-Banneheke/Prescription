import 'package:flutter/material.dart';
import 'package:prescription/bloc/doctor_details_bloc.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/screens/editDetails.dart';
import 'package:prescription/screens/home.dart';
import 'package:prescription/screens/newPrescription.dart';
import 'package:prescription/screens/confirmed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(BlocProvider<DoctorDetailsBloc>(
  create: (context) => DoctorDetailsBloc(DoctorDetailsModel()),
  child:   new MaterialApp(
      initialRoute: '/newPrescription',
      routes: {
//        '/' : (context)  => Home(),
        '/newPrescription' : (context) => NewPrescription(),
        '/confirmed' : (context) => Confirmed(),
        '/editDetails' : (context) => EditDetails(),
      }
  ),
));
