import 'package:flutter_bloc/flutter_bloc.dart';

class SortByProvider extends Cubit<Map<String, dynamic>> {
  SortByProvider()
      : super({
          'sortByRate': 'Popular',
          'sortByPrice': 'Expensive first',
          'sortByAddedTime': 'Recently added'
        });
  byRate(String newValue) {
    emit({
      'sortByRate': newValue,
      'sortByPrice': state['sortByPrice'],
      'sortByAddedTime': state['sortByAddedTime']
    });
  }

  byPrice(String newValue) {
    emit({
      'sortByRate': state['sortByRate'],
      'sortByPrice': newValue,
      'sortByAddedTime': state['sortByAddedTime']
    });
  }

  byAddedTime(String newValue) {
    emit({
      'sortByRate': state['sortByRate'],
      'sortByPrice': state['sortByPrice'],
      'sortByAddedTime': newValue
    });
  }
}
