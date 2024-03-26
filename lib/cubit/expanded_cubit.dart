import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
class ExpandedCubit extends Cubit<bool> {
  ExpandedCubit() : super(false);

  void expandedWidget() => emit(true);
  void notExpandedWidget() => emit(false);
}
