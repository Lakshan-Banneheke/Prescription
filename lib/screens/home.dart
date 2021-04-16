import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription/bloc/doctor_details_bloc.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/widgets/doctorDetailsView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Map doctorsDetails;

  @override
  Widget build(BuildContext context) {
//    data =  ModalRoute.of(context).settings.arguments;
//    if (data != null) {
//      if (data.containsKey('doctorsDetails')) {
//        if (data['doctorsDetails'] != null)
//          doctorsDetails = data['doctorsDetails'];
//      }
//    }
//    print(doctorsDetails);
    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsModel>(
    builder: (context, doctorDetailsModel) {
      return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,
            //      appBar: AppBar(
            //        title: Text('Prescription'),
            //        backgroundColor: Colors.blue[900],
            //        centerTitle: true,
            //      ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/steth-2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                //        padding: EdgeInsets.all(30),
                //        color: Colors.blue[900],
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.0),

                    DoctorDetailsView(title: "Doctor 1", doctor: doctorDetailsModel.doc1),
                    Divider(
                      height: 30,
                      color: Colors.grey[600],indent: 10,
                      endIndent: 10,
                    ),
                    doctorDetailsModel.count == 2 ?
                    DoctorDetailsView(
                      title: "Doctor 2",
                      doctor: doctorDetailsModel.doc2,
                    ) : Container(),
                    SizedBox(height: 5.0),
                                  GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/newPrescription');
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                                      padding: EdgeInsets.symmetric(vertical: 25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.blue,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            size: 50,
                                          ),
                                          SizedBox(width: 20),
                                          Text("New Prescription"),


                                        ],
                                      ),
                                  ),
                                  ),

                    RaisedButton.icon(
                      icon: Icon(Icons.edit),
                      label: Text("Edit details"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/editDetails');
                      },
                    ),
                  ],
                )
            )
        ),
      );
    }
    );

    }
}
