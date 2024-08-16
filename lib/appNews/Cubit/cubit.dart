 
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../NetWork/netWork.dart';
import '../layut/models/medules/Health.dart';
import '../layut/models/medules/Scines/sines.dart';
import '../layut/models/medules/Sport/sport.dart';
import '../layut/models/medules/buiseness/business.dart';
import 'States.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(IntitailStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int curennentIndex = 0;
  List<Widget> bottonNavation = [
    Icon(
      Icons.business,
      size: 30,
      color: Colors.white,
    ),
    Icon(Icons.sports, size: 30, color: Colors.white),
    Icon(Icons.science, size: 30, color: Colors.white),
    Icon(Icons.health_and_safety, size: 30, color: Colors.white),
  ];
  List<BottomNavigationBarItem> bottonNev = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: "business",
        backgroundColor: Colors.red),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: "Sports",
        backgroundColor: Colors.pink),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: "science",
        backgroundColor: Colors.deepOrange),
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety),
        label: "Healths",
        backgroundColor: Colors.grey),
  ];
  List<Widget> Pages = [
    Business_Seccren(),
    Sport_Seccren(),
    Scines_Seccren(),
    Health_Seccren()
  ];
  void changedStatesBottonNav(int index) {
    curennentIndex = index;
    emit(BottonNavtionBar());
  }

  List<dynamic> Businnes = [];
  void getBusinness() {
    emit(LoedingBusinnesStates());
    NetWorkNewsApp.getData(Uri: "v2/top-headlines", quere: {
      "country": "eg",
      "category": "business",
      "apiKey": "b5a4adc270c04fbf9d36fa86157a015e"
    }).then((value) {
      print(value.data.toString());
      Businnes = value.data['articles'];
      print("llllllllllllllllllllllllll");
      print(Businnes.length);
      emit(SuccesfulyBusinnesStates());
    }).catchError((onError) {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print(onError.toString());
      emit(ErrorBusinnessStates());
    });
  }

  List<dynamic> Scinecs = [];
  void getScinecs() {
    emit(LoedingScinecsStates());
    NetWorkNewsApp.getData(Uri: "v2/top-headlines", quere: {
      "country": "eg",
      "category": "science",
      "apiKey": "b5a4adc270c04fbf9d36fa86157a015e"
    }).then((value) {
      print(value.data.toString());
      Scinecs = value.data['articles'];
      print("llllllllllllllllllllllllll");
      print(Scinecs.length);
      emit(SuccesfulyScinecsStates());
    }).catchError((onError) {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print(onError.toString());
      emit(ErrorScinecsStates());
    });
  }

  List<dynamic> Sports = [];
  void getSports() {
    emit(LoedingSportsStates());
    NetWorkNewsApp.getData(Uri: "v2/top-headlines", quere: {
      "country": "eg",
      "category": "sports",
      "apiKey": "b5a4adc270c04fbf9d36fa86157a015e"
    }).then((value) {
      print(value.data.toString());
      Sports = value.data['articles'];
      print("llllllllllllllllllllllllll");
      print(Sports.length);
      emit(SuccesfulySportsStates());
    }).catchError((onError) {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print(onError.toString());
      emit(ErrorSportsStates());
    });
  }

  List<dynamic> Health = [];
  void getHealth() {
    emit(LoedingHealthStates());
    NetWorkNewsApp.getData(Uri: "v2/top-headlines", quere: {
      "country": "eg",
      "category": "health",
      "apiKey": "b5a4adc270c04fbf9d36fa86157a015e"
    }).then((value) {
      print(value.data.toString());
      Health = value.data['articles'];
      print("llllllllllllllllllllllllll");
      print(Health.length);
      emit(SuccesfulyHealthStates());
    }).catchError((onError) {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print(onError.toString());
      emit(ErrorHealthStates());
    });
  }

  List<dynamic> Searsh = [];
  void getSearsh(String Val) {
    emit(LoedingSearshStates());
    NetWorkNewsApp.getData(
            Uri: "v2/everything",
            quere: {"q": "$Val", "apiKey": "b5a4adc270c04fbf9d36fa86157a015e"})
        .then((value) {
      print(value.data.toString());
      Searsh = value.data['articles'];
      print("llllllllllllllllllllllllll");
      print(Searsh.length);
      emit(SuccesfulySearshStates());
    }).catchError((onError) {
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print(onError.toString());
      emit(ErrorSearshStates());
    });
  }

  bool ismode = false;

  void ChangedMode() {
    ismode = !ismode;
    emit(ChangedModeStates());
  }
}
