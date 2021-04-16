import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription/bloc/doctor_details_bloc.dart';
import 'package:prescription/events/doctor_details_event.dart';
import 'package:prescription/models/doctor.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/shared/constants.dart';
import 'package:prescription/widgets/doctorDetails.dart';

class EditDetails extends StatefulWidget {
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  final _formKey = GlobalKey<FormState>();
  final Stylesheet _styleSheet = Stylesheet();

  Doctor doc1;
  Doctor doc2;
  String address;
//  int count = 1;
//  Map data = {};
  DoctorDetailsModel doctorDetailsModel;
//  DoctorDetailsModel doctorDetailsLocal;
//  Map dataReceived;

  @override
  Widget build(BuildContext context) {
    doc1 = Doctor();
    doc2 = Doctor();

//    dataReceived = ModalRoute.of(context).settings.arguments;
//    if (dataReceived != null){
//      if (dataReceived.containsKey('doctorsDetails')) {
//        var details = dataReceived['doctorsDetails'];
//        if (details != null) {
//          doctorDetails = details;
//          doc1 = doctorDetails['doc1'];
//          doc2 = doctorDetails['doc2'];
//          doctorDetails['count'] == 2 ? count = 2 : null;
//        }
//      }
//    }
//    TextEditingController address = TextEditingController(text: doctorDetails['address']);

    return BlocBuilder<DoctorDetailsBloc, DoctorDetailsModel>(
        builder: (context, doctorDetailsModel) {
          return  Container(
//        decoration: BoxDecoration(
//        image: DecorationImage(
//        image: AssetImage('assets/blueGradient.jpg'),
//        fit: BoxFit.cover
//        ),
//        ),
            child: Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
//                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text("Edit Details"),
                  backgroundColor: Colors.blue[900],
                  centerTitle: true,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/newPrescription');
                    },
                    child: Icon(
                      Icons.home,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/steth-3.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                        child: Form(
                            key : _formKey,
                            child: Column(
                              children: <Widget>[
                                DoctorDetails(
                                        title: "Doctor 1",
                                        addToDoc: addToDoc1,
                                        doctor: doctorDetailsModel.doc1,
                                ),
                                Divider(
                                  height: 30,
                                  color: Colors.grey[600],indent: 10,
                                  endIndent: 10,
                                ),
                                doctorDetailsModel.count == 2 ?
                                  DoctorDetails(
                                    title: "Doctor 2",
                                    addToDoc: addToDoc2,
                                    doctor: doctorDetailsModel.doc2,
                                  ) : Container(),
                                SizedBox(height: 5.0),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 16, 10),
                                    padding: EdgeInsets.fromLTRB(28,20,28,30),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withAlpha(32),
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Address",
                                          style: _styleSheet._textStyle,
                                        ),
                                        SizedBox(height: 8.0),
                                        TextFormField(
                                                style: _styleSheet._inputBox,
                                                validator: (val) => val.isEmpty ? "Insert address" : null,
                                                decoration: textInputDecorationDetails.copyWith(
                                                  contentPadding: EdgeInsets.all(10.0),
                                                  hintText: "Enter address",
                                                ),
                                                textCapitalization: TextCapitalization.sentences,
                                                controller: TextEditingController(text: doctorDetailsModel.address),
                                                onSaved: (val) { addToAddress(val);},
                                        )
                                      ],
                                    )
                                ),
                                Divider(
                                  height: 50,
                                  color: Colors.grey[600],indent: 10,
                                  endIndent: 10,
                                ),
                                SizedBox(height: 30,),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      doctorDetailsModel.count == 1 ?
                                      FloatingActionButton(
                                        heroTag: "btn1",
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          saveForm(_formKey, context, doc1, doc2);
                                          changeCount(2);
                                        },
                                      ):
                                      FloatingActionButton.extended(
                                        heroTag: "btn2",
                                        onPressed: () {
//                                          changeCount(1);
                                          BlocProvider.of<DoctorDetailsBloc>(context).add(DoctorDetailsEvent.deleteDoc2());
                                        },
                                        icon: Icon(Icons.delete_outline),
                                        label: Text('Remove Doctor 2'),
                                        backgroundColor: Colors.red[700],
                                      ),

                                      SizedBox(width:10),
                                      FloatingActionButton(
                                        heroTag: "btn3",
                                        child: Icon(Icons.check),
                                        onPressed: () {
                                          bool done = saveForm(_formKey, context, doc1, doc2);
                                            if (done == true) {
                                              Navigator.pushReplacementNamed(context, '/newPrescription');
                                          }
                                        },

                                      ),
                                    ],
                                  ),
                                )
                              ],

                            )
                        )
                    )
                )

            ),
          );
        }
    ) ;


  }

  void addToDoc1(topic, value){
    switch(topic){
      case "name":
        doc1.setName(value);
        break;
      case "qualifications":
        doc1.setQualification(value);
        break;
      case "slmc":
        doc1.setSlmc(value);
        break;
    }
  }

  void addToDoc2(topic, value){
    switch(topic){
      case "name":
        doc2.setName(value);
        break;
      case "qualifications":
        doc2.setQualification(value);
        break;
      case "slmc":
        doc2.setSlmc(value);
        break;
    }
  }

  void addToAddress(value){
    BlocProvider.of<DoctorDetailsBloc>(context).add(DoctorDetailsEvent.addAddress(value));
  }

  void changeCount(val){
    BlocProvider.of<DoctorDetailsBloc>(context).add(DoctorDetailsEvent.changeCount(val));  }
}

  bool saveForm(_formKey, context, doc1, doc2){
    if (_formKey.currentState.validate()) {
      final FormState form = _formKey.currentState;
      form.save();
      BlocProvider.of<DoctorDetailsBloc>(context).add(
          DoctorDetailsEvent.addDoc1(doc1));
      BlocProvider.of<DoctorDetailsBloc>(context).add(
          DoctorDetailsEvent.addDoc2(doc2));
      return true;
    }
    return false;
  }

class Stylesheet {
  final _textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  final _inputBox = TextStyle(
      color: Colors.black
  );
}