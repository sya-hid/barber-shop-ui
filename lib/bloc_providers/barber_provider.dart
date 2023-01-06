import 'package:barber_app_ui/models/barber_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarbersProvider extends Cubit<List<Barber>> {
  BarbersProvider() : super(barbers);

  getData(
      {required List<dynamic> selectedGender,
      required List<dynamic> selectedService,
      required double selectedPrice,
      required double minRate,
      String? sortByRate,
      String? sortByPrice,
      String? sortByAddedTime}) {
    List<String> newSelectedGender = [];
    selectedGender.where((element) {
      if (element[1] == true) {
        newSelectedGender.add(element[0]);
      }
      return true;
    }).toList();
    List<String> newSelectedServices = [];
    selectedService.where((element) {
      if (element[1] == true) {
        newSelectedServices.add(element[0]);
      }
      return true;
    }).toList();
    List<Barber> listBarber = [];
    barbers.where((element) {
      if (newSelectedServices
              .toSet()
              .intersection(element.services.toSet())
              .isNotEmpty &&
          element.price <= selectedPrice &&
          newSelectedGender.contains(element.gender) &&
          element.rate >= minRate) {
        listBarber.add(element);
      }
      return true;
    }).toList();
    if (sortByRate != null) {
      listBarber.sort((a, b) {
        if (sortByRate == 'Popular') {
          return b.rate.compareTo(a.rate);
        } else {
          return a.rate.compareTo(b.rate);
        }
      });
    }
    if (sortByPrice != null) {
      listBarber.sort((a, b) {
        if (sortByPrice == 'Expensive first') {
          return b.price.compareTo(a.price);
        } else {
          return a.price.compareTo(b.price);
        }
      });
    }
    if (sortByAddedTime != null) {
      barbers.sort((a, b) {
        if (sortByAddedTime == 'Recently added') {
          return b.dateAdded.compareTo(a.dateAdded);
        } else {
          return a.dateAdded.compareTo(b.dateAdded);
        }
      });
    }
    emit(listBarber);
  }
}
