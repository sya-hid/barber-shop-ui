import 'package:barber_app_ui/models/genders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderProvider extends Cubit<List<dynamic>> {
  GenderProvider() : super(gender);
  changeValue(int index, bool value) {
    var selectGender = [...state];
    selectGender[index][1] = value;
    emit(selectGender);
  }
}
