import 'package:flutter/material.dart';
import 'package:prescription/models/doctor.dart';
import 'package:prescription/models/doctor_details_model.dart';
import 'package:prescription/shared/constants.dart';


class DoctorDetailsView extends StatelessWidget {
  final String title;
  final Stylesheet _styleSheet = Stylesheet();
  final Doctor doctor;

  DoctorDetailsView({
    @required this.title,
    @required this.doctor,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        doctor.name != null ?
        Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.fromLTRB(20, 20, 30, 30),
          decoration: BoxDecoration(
            color: Colors.grey[50],
//        image: DecorationImage(
//          image: AssetImage("assets/blueGradient.jpg"),
//          fit: BoxFit.cover,
//        ),
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
                  alignment: Alignment.topLeft,
              child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                  )
              ),
                ),
                SizedBox(height: 15.0),
//            Text(
//              "Name",
//              style: _styleSheet._titleTextStyle,
//            ),
//            SizedBox(height: 8.0),
                Text(
                  doctor.name ?? "No Doctor added",
                  style: _styleSheet._textStyle,
                ),
                SizedBox(height: 15.0),
//            Text(
//              "Qualifications",
//              style: _styleSheet._titleTextStyle,
//            ),
//            SizedBox(height: 8.0),
                Text(
                  doctor.qualification ?? "No Doctor added",
                  style: _styleSheet._textStyle,
                ),
                SizedBox(height: 15.0),
//            Text(
//              "SLMC Registraion Number",
//              style: _styleSheet._titleTextStyle,
//            ),
//            SizedBox(height: 8.0),
                Text(
                  doctor.slmc ?? "No Doctor added",
                  style: _styleSheet._textStyle,
                ),

              ]
          ),
        ):Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red[900],
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "No Doctor added",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )
              ),
            ],
          )
        )
      ],
    );
  }
}

class Stylesheet {
  final _textStyle = TextStyle(
    fontSize: 16,
//    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  final _titleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  final _inputBox = TextStyle(
      color: Colors.black
  );
}