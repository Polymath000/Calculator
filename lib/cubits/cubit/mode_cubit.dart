import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(ModeInitial());
bool isChange = false;
  void mode(){
    if(isChange){
      
      emit(ModeDark());
    }
    emit(ModeLight());
  }
}
