import 'package:barber_app_ui/bloc_providers/barber_provider.dart';
import 'package:barber_app_ui/bloc_providers/gender_provider.dart';
import 'package:barber_app_ui/bloc_providers/price_provider.dart';
import 'package:barber_app_ui/bloc_providers/rate_provider.dart';
import 'package:barber_app_ui/bloc_providers/service_provider.dart';
import 'package:barber_app_ui/const.dart';
import 'package:barber_app_ui/models/genders.dart';
import 'package:barber_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VertFilter extends StatelessWidget {
  const VertFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var theme = Theme.of(context).copyWith(dividerColor: transparent);
    ServicesProvider servicesProvider =
        BlocProvider.of<ServicesProvider>(context);
    GenderProvider genderProvider = BlocProvider.of<GenderProvider>(context);
    PriceProvider priceProvider = BlocProvider.of<PriceProvider>(context);
    MinRateProvider minRateProvider = BlocProvider.of<MinRateProvider>(context);
    BarbersProvider barbersProvider = BlocProvider.of<BarbersProvider>(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      color: white,
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth! * 0.25,
      child: Theme(
        data: theme,
        child: Column(children: [
          BlocBuilder<ServicesProvider, List<dynamic>>(
            bloc: servicesProvider,
            builder: (context, state) {
              return ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                childrenPadding: const EdgeInsets.all(0),
                initiallyExpanded: true,
                iconColor: black.withOpacity(0.5),
                title: Text(
                  'Type of service',
                  style: font.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold, color: black),
                ),
                children: [
                  ...List.generate(
                      state.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state[index][0],
                                style: font.copyWith(fontSize: 12),
                              ),
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  fillColor: MaterialStatePropertyAll(
                                      grey.withOpacity(0.2)),
                                  checkColor: deepPurple,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: state[index][1],
                                  onChanged: (value) {
                                    servicesProvider.changeValue(index, value!);
                                    barbersProvider.getData(
                                        selectedGender: genderProvider.state,
                                        selectedService: servicesProvider.state,
                                        selectedPrice: priceProvider.state,
                                        minRate: minRateProvider.state);
                                  },
                                ),
                              )
                            ],
                          ))
                ],
              );
            },
          ),
          BlocBuilder<PriceProvider, double>(
            bloc: priceProvider,
            builder: (context, state) {
              return ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                childrenPadding: const EdgeInsets.all(0),
                initiallyExpanded: true,
                iconColor: black.withOpacity(0.5),
                title: Text(
                  'Pricing',
                  style: font.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold, color: black),
                ),
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 3,
                        overlayShape: SliderComponentShape.noThumb,
                        activeTrackColor: orange,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 6),
                        valueIndicatorColor: orange,
                        thumbColor: orange,
                        showValueIndicator: ShowValueIndicator.always),
                    child: Slider(
                      value: state,
                      min: 100,
                      max: 500,
                      label: state.round().toString(),
                      onChanged: (value) {
                        priceProvider.changeValue(value);
                        barbersProvider.getData(
                            selectedGender: genderProvider.state,
                            selectedService: servicesProvider.state,
                            selectedPrice: priceProvider.state,
                            minRate: minRateProvider.state);
                      },
                    ),
                  )
                ],
              );
            },
          ),
          BlocBuilder<GenderProvider, List<dynamic>>(
            bloc: genderProvider,
            builder: (context, state) {
              return ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                childrenPadding: const EdgeInsets.all(0),
                initiallyExpanded: true,
                iconColor: black.withOpacity(0.5),
                title: Text(
                  'Barber\'s gender',
                  style: font.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold, color: black),
                ),
                children: [
                  ...List.generate(
                      gender.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state[index][0],
                                style: font.copyWith(fontSize: 12),
                              ),
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  fillColor: MaterialStatePropertyAll(
                                      grey.withOpacity(0.2)),
                                  checkColor: deepPurple,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: state[index][1],
                                  onChanged: (value) {
                                    genderProvider.changeValue(index, value!);
                                    barbersProvider.getData(
                                        selectedGender: genderProvider.state,
                                        selectedService: servicesProvider.state,
                                        selectedPrice: priceProvider.state,
                                        minRate: minRateProvider.state);
                                  },
                                ),
                              )
                            ],
                          ))
                ],
              );
            },
          ),
          BlocBuilder<MinRateProvider, double>(
            bloc: minRateProvider,
            builder: (context, state) {
              return ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                childrenPadding: const EdgeInsets.all(0),
                initiallyExpanded: true,
                iconColor: black.withOpacity(0.5),
                title: Text(
                  'Rating',
                  style: font.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold, color: black),
                ),
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: RatingBar.builder(
                      initialRating: state,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.only(right: 5),
                      itemSize: 18,
                      unratedColor: grey.withOpacity(0.5),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: orange,
                      ),
                      onRatingUpdate: (value) {
                        minRateProvider.changeValue(value);
                        barbersProvider.getData(
                            selectedGender: genderProvider.state,
                            selectedService: servicesProvider.state,
                            selectedPrice: priceProvider.state,
                            minRate: minRateProvider.state);
                      },
                    ),
                  )
                ],
              );
            },
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            childrenPadding: const EdgeInsets.all(0),
            initiallyExpanded: true,
            iconColor: black.withOpacity(0.5),
            title: Text(
              'Location',
              style: font.copyWith(
                  fontSize: 14, fontWeight: FontWeight.bold, color: black),
            ),
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: grey.withOpacity(0.3),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(Icons.search, size: 16),
                      hintText: 'Location',
                      hintStyle: font.copyWith(fontSize: 12)),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
