
import 'package:prescription/models/doctor.dart';
import 'package:prescription/models/doctor_details_model.dart';

enum EventType{addDoc1, addDoc2, deleteDoc2, addAddress, changeCount}

class DoctorDetailsEvent {
  Doctor doc1;
  Doctor doc2;
  String address;
  EventType type;
  int count;

  DoctorDetailsEvent.addDoc1(Doctor doc){
    this.doc1= doc;
    this.type = EventType.addDoc1;
  }

  DoctorDetailsEvent.addDoc2(Doctor doc){
    this.doc2= doc;
    this.type = EventType.addDoc2;
  }

  DoctorDetailsEvent.addAddress(String address){
    this.address= address;
    this.type = EventType.addAddress;
  }

  DoctorDetailsEvent.deleteDoc2(){
    this.type = EventType.deleteDoc2 ;
  }

  DoctorDetailsEvent.changeCount(count){
    this.type = EventType.changeCount;
    this.count = count;
  }
}