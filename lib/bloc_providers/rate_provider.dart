import 'package:flutter_bloc/flutter_bloc.dart';

class MinRateProvider extends Cubit<double> {
  MinRateProvider() : super(1.0);
  double rate = 1;
  changeValue(double value) {
    emit(value);
  }
}
