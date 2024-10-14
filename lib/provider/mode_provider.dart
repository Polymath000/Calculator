import 'package:flutter/material.dart';

class ModeProvider extends ChangeNotifier{
  bool isChange = true;

  changeMode(){
    if(isChange == true){
      isChange = false;
      notifyListeners();
    }else{
      isChange = true;
      notifyListeners();
    }
  }
}