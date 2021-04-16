import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription/bloc/doctor_details_bloc.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/shared/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:prescription/widgets/doctorDetailsView.dart';


class NewPrescription extends StatefulWidget {
  @override
  _NewPrescriptionState createState() => _NewPrescriptionState();
}

class _NewPrescriptionState extends State<NewPrescription> {
  final _formKey = GlobalKey<FormState>();
//  final List<String> titles = ['Mr.', 'Ms.', 'Baby'];
//  String title;
  String name;
  String age;
  String day;
  String prescription;
  Map data = {};
  Map doctorsDetails;
  Map temp;

  @override
  Widget build(BuildContext context) {
//    temp =  ModalRoute.of(context).settings.arguments;
//    if (temp != null) {
//      if (temp.containsKey('doctorsDetails')) {
//        if (temp['doctorsDetails'] != null)
//          doctorsDetails = temp['doctorsDetails'];
//      }
//    }

    var dateController = TextEditingController(text: day);
    return Scaffold(

      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text('Prescription'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
//        leading: GestureDetector(
//          onTap: () {
//            Navigator.pop(context);
//          },
//          child: Icon(
//            Icons.home,
//          ),
//        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.refresh, color: Colors.white),
            label: Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                ),
            ),
            color: Colors.blue[900],
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/newPrescription');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//
          child: Column(
            children: [
              Form(
                key : _formKey,
                child: Column(
                  children: <Widget>[
//                DropdownButtonFormField(
//                      decoration: textInputDecoration,
//                      value: title ?? titles[0],
//                      items: titles.map((val) {
//                        return DropdownMenuItem(
//                          value: val,
//                          child: Text(val),
//                        );
//                      }).toList(),
//                      onChanged: (val) => setState(() => title = val),
//                    ),
                    SizedBox(height: 15.0),

                    TextFormField(
//                  validator: (val) => val.isEmpty ? "Insert name" : null,
                      decoration: textInputDecoration.copyWith(labelText: 'Name'),
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    ),
                    SizedBox(height: 5.0),
                    TextFormField(
//                  validator: (val) => val.isEmpty ? "Insert age" : null,
                      decoration: textInputDecoration.copyWith(labelText: 'Age'),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          age = val;
                        });
                      },
                    ),
                    SizedBox(height: 5.0),
                    TextFormField(
                      controller: dateController,
//                  keyboardType: TextInputType.multiline,
//                  textCapitalization: TextCapitalization.sentences,
//                  maxLines: null,
//                  validator: (val) => val.isEmpty ? "Insert date" : null,
                      decoration: textInputDecoration.copyWith(labelText: 'Date'),
                      onTap: () {
                        showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2100)).then((value) {
                              setState(() {
                                var date = DateTime.parse(value.toString());
                                var fdate = DateFormat().add_yMd().format(date);
                                var formattedDate = "${date.day}-${date.month}-${date.year}";
                                day = fdate.toString();
                              });
                        });


                      },
                    ),

                    SizedBox(height: 5.0),

                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: null,
                      validator: (val) => val.isEmpty ? "Insert prescription" : null,
                      decoration: textInputDecoration.copyWith(labelText: 'Prescription'),
                      onChanged: (val) {
                        setState(() {
                          prescription = val;
                        });
                      },
                    ),
                    SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          data['name'] = name ?? "Not specified";
                          data['age'] = age ?? "Not specified";
                          data['day'] = day ?? "Not specified";
                          data['prescription'] = prescription;
                          Navigator.pushNamed(context, '/confirmed',
                              arguments: {'prescription': data});
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.blue[900],
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
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Save and view prescription",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),

//                    Align(
//                      alignment: Alignment.bottomRight,
//                      child: FloatingActionButton(
//                        backgroundColor: Colors.blue[900],
//                        child: Icon(
//                            Icons.check
//                        ),
//                        onPressed: () {
//                          if (_formKey.currentState.validate()){
//                              data['name'] = name ?? "Not specified";
//                              data['age'] = age ?? "Not specified";
//                              data['day'] = day ?? "Not specified";
//                              data['prescription'] = prescription;
//                              Navigator.pushNamed(context, '/confirmed', arguments: {'prescription': data});
//                          }
//                        },
//
//                      ),
//                    )
                  ],
                )
              ),
            BlocBuilder<DoctorDetailsBloc, DoctorDetailsModel>(
            builder: (context, doctorDetailsModel) {
              return Column(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0),

                  DoctorDetailsView(title: "Doctor 1", doctor: doctorDetailsModel.doc1),
                  SizedBox(height: 20.0),

                  doctorDetailsModel.count == 2 ?
                  DoctorDetailsView(
                    title: "Doctor 2",
                    doctor: doctorDetailsModel.doc2,
                  ) : Container(),
                  SizedBox(height: 10.0),
                ],
              );
              }
            ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/editDetails');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue[900],
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
                        Icons.edit,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                          "Edit Doctor details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),


        ),
      )
    );
  }
}

