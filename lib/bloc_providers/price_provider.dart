import 'package:flutter_bloc/flutter_bloc.dart';

class PriceProvider extends Cubit<double> {
  PriceProvider() : super(250.0);
  double price = 250;
  changeValue(double value) {
    emit(value);
  }
}
