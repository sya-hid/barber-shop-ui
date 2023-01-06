import 'package:barber_app_ui/bloc_providers/barber_provider.dart';
import 'package:barber_app_ui/bloc_providers/gender_provider.dart';
import 'package:barber_app_ui/bloc_providers/price_provider.dart';
import 'package:barber_app_ui/bloc_providers/rate_provider.dart';
import 'package:barber_app_ui/bloc_providers/service_provider.dart';
import 'package:barber_app_ui/bloc_providers/sort_provider.dart';
import 'package:barber_app_ui/const.dart';
import 'package:barber_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorFilter extends StatelessWidget {
  const HorFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ServicesProvider servicesProvider =
        BlocProvider.of<ServicesProvider>(context);
    GenderProvider genderProvider = BlocProvider.of<GenderProvider>(context);
    PriceProvider priceProvider = BlocProvider.of<PriceProvider>(context);
    MinRateProvider minRateProvider = BlocProvider.of<MinRateProvider>(context);
    BarbersProvider barbersProvider = BlocProvider.of<BarbersProvider>(context);
    SortByProvider sortByProvider = BlocProvider.of<SortByProvider>(context);
    return Row(
      children: [
        BlocSelector<SortByProvider, Map<String, dynamic>, String>(
          selector: (state) => state['sortByRate'],
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: white),
              child: DropdownButton(
                value: state,
                icon: const Icon(Icons.keyboard_arrow_up),
                borderRadius: BorderRadius.circular(15),
                dropdownColor: white,
                isDense: true,
                underline: const SizedBox(),
                iconSize: 18,
                elevation: 1,
                style: font.copyWith(
                  fontSize: 12,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
                items: const [
                  DropdownMenuItem(value: 'Popular', child: Text('Popular')),
                  DropdownMenuItem(value: 'Unpopular', child: Text('Unpopular'))
                ],
                onChanged: (value) {
                  sortByProvider.byRate(value!);
                  barbersProvider.getData(
                      selectedGender: genderProvider.state,
                      selectedService: servicesProvider.state,
                      selectedPrice: priceProvider.state,
                      minRate: minRateProvider.state,
                      sortByRate: value);
                },
              ),
            );
          },
        ),
        BlocSelector<SortByProvider, Map<String, dynamic>, String>(
          selector: (state) => state['sortByPrice'],
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: white),
              child: DropdownButton(
                value: state,
                icon: const Icon(Icons.keyboard_arrow_up),
                borderRadius: BorderRadius.circular(15),
                dropdownColor: white,
                isDense: true,
                underline: const SizedBox(),
                iconSize: 18,
                elevation: 1,
                style: font.copyWith(
                  fontSize: 12,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'Expensive first', child: Text('Expensive first')),
                  DropdownMenuItem(
                      value: 'Cheaper first', child: Text('Cheaper first'))
                ],
                onChanged: (value) {
                  sortByProvider.byPrice(value!);
                  barbersProvider.getData(
                      selectedGender: genderProvider.state,
                      selectedService: servicesProvider.state,
                      selectedPrice: priceProvider.state,
                      minRate: minRateProvider.state,
                      sortByPrice: value);
                },
              ),
            );
          },
        ),
        BlocSelector<SortByProvider, Map<String, dynamic>, String>(
          selector: (state) => state['sortByAddedTime'],
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: white),
              child: DropdownButton(
                value: state,
                icon: const Icon(Icons.keyboard_arrow_up),
                borderRadius: BorderRadius.circular(15),
                dropdownColor: white,
                isDense: true,
                underline: const SizedBox(),
                iconSize: 18,
                elevation: 1,
                style: font.copyWith(
                  fontSize: 12,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'Recently added', child: Text('Recently added')),
                  DropdownMenuItem(value: 'Earlier', child: Text('Earlier'))
                ],
                onChanged: (value) {
                  sortByProvider.byAddedTime(value!);
                  barbersProvider.getData(
                      selectedGender: genderProvider.state,
                      selectedService: servicesProvider.state,
                      selectedPrice: priceProvider.state,
                      minRate: minRateProvider.state,
                      sortByAddedTime: value);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
