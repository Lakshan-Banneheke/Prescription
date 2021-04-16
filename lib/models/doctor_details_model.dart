import 'doctor.dart';

class DoctorDetailsModel {
  Doctor doc1;
  Doctor doc2;
  String address;
  int count;

  DoctorDetailsModel(){
    doc1 = Doctor();
    doc2 = Doctor();
    count = 1;
  }

  DoctorDetailsModel.create(doc1, doc2, address, count){
    this.doc1 = doc1;
    this.doc2 = doc2;
    this.address = address;
    this.count = count;
  }

  void setDoc1(doc){this.doc1 = doc;}
  void setDoc2(doc){this.doc2 = doc;}

  void setAddress(address){this.address = address;}
  void deleteDoc2(){
    doc2 = null;
    this.count = 1;
  }

  void setCount(count){
    this.count = count;
  }
}