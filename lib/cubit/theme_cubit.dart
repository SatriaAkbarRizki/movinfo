import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool>{
  ThemeCubit() : super(false);
  
  void themeSwitch (bool mode){
    emit(mode);
  }
}