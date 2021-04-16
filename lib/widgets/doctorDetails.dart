import 'package:flutter/material.dart';
import 'package:prescription/models/doctor.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/shared/constants.dart';


class DoctorDetails extends StatelessWidget {
  final Function addToDoc;
  final String title;
  final Stylesheet _styleSheet = Stylesheet();
  final Doctor doctor;

  DoctorDetails({
    @required this.addToDoc,
    @required this.title,
    @required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(text: doctor != null ? doctor.name: null);
    TextEditingController qualifications = TextEditingController(text: doctor != null ? doctor.qualification : null);
    TextEditingController slmc = TextEditingController(text: doctor != null ? doctor.slmc : null);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 16, 10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(32),
            blurRadius: 20,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 25,
                  )
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              "Name",
              style: _styleSheet._textStyle,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              style: _styleSheet._inputBox,
              validator: (val) => val.isEmpty ? "Insert name" : null,
              decoration: textInputDecorationDetails.copyWith(
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Enter name",
              ),
              textCapitalization: TextCapitalization.sentences,
              controller: name,
              onSaved: (val) {
                addToDoc("name", val);
              },
            ),
            SizedBox(height: 15.0),
            Text(
              "Qualifications",
              style: _styleSheet._textStyle,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              style: _styleSheet._inputBox,
              validator: (val) => val.isEmpty ? "Insert qualifications" : null,
              textCapitalization: TextCapitalization.sentences,
              controller: qualifications,
              decoration: textInputDecorationDetails.copyWith(
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Enter Qualification",
              ),
              onSaved: (val) {
                addToDoc('qualifications', val);
              },
            ),
            SizedBox(height: 15.0),
            Text(
              "SLMC Registraion Number",
              style: _styleSheet._textStyle,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              style: _styleSheet._inputBox,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.number,
              validator: (val) => val.isEmpty? "Insert SLMC registration number": null,
              controller: slmc,
              decoration: textInputDecorationDetails.copyWith(
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Enter SLMC No.",

              ),
              onSaved: (val) {
                addToDoc('slmc', val);
              },
            ),


          ]
      ),
    );
  }
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