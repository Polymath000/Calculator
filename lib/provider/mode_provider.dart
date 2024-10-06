import 'package:flutter/material.dart';

class ModeProvider extends ChangeNotifier{
  bool _isChange = true;

  bool get isChange => _isChange;

  set isChange(bool value) {
    _isChange = value;
  }

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