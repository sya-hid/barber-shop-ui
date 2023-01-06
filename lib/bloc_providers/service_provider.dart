import 'package:barber_app_ui/models/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesProvider extends Cubit<List<dynamic>> {
  ServicesProvider() : super(services);

  changeValue(int index, bool value) {
    var selectService = [...state];
    selectService[index][1] = value;
    emit(selectService);
  }
}
