import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription/events/doctor_details_event.dart';
import 'package:prescription/models/doctor.dart';
import 'package:prescription/models/doctor_details_model.dart';

class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsModel>{
  DoctorDetailsBloc(DoctorDetailsModel initialState) : super(initialState);

//  Map get initialState => Map() ;

  @override
  Stream<DoctorDetailsModel> mapEventToState(DoctorDetailsEvent event) async* {
    switch(event.type){
      case EventType.addDoc1:
        DoctorDetailsModel newState = createState(state);
        newState.setDoc1(event.doc1);
        yield newState;
        break;
      case EventType.addDoc2:
        DoctorDetailsModel newState = createState(state);
        newState.setDoc2(event.doc2);
        yield newState;
        break;
      case EventType.addAddress:
        DoctorDetailsModel newState = createState(state);
        newState.setAddress(event.address);
        yield newState;
        break;

      case EventType.changeCount:
        DoctorDetailsModel newState = createState(state);
        newState.setCount(event.count);
        print("Count");
        print(newState.count);
        yield newState;
        break;

      case EventType.deleteDoc2:
        DoctorDetailsModel newState = createState(state);
        newState.deleteDoc2();
        yield newState;
        break;


      default:
        throw Exception('Event not found $event');

    }
  }


  DoctorDetailsModel createState(DoctorDetailsModel state){
    Doctor doc1 = state.doc1;
    Doctor doc2 = state.doc2;
    String address = state.address;
    int count = state.count;
    return DoctorDetailsModel.create(doc1, doc2, address, count);
    
  }
}