import 'package:barber_app_ui/bloc_providers/barber_provider.dart';
import 'package:barber_app_ui/bloc_providers/service_provider.dart';
import 'package:barber_app_ui/const.dart';
import 'package:barber_app_ui/models/barber_model.dart';
import 'package:barber_app_ui/size_config.dart';
import 'package:barber_app_ui/widgets/barber_item.dart';
import 'package:barber_app_ui/widgets/hor_filter.dart';
import 'package:barber_app_ui/widgets/vert_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BlocProvider.of<ServicesProvider>(context);
    BarbersProvider barbersProvider = BlocProvider.of<BarbersProvider>(context);
    return Row(
      children: [
        //vert filter
        const VertFilter(),
        //list barber
        Container(
          color: bgColor,
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth! * 0.75,
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: Column(
            children: [
              //hor filer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most popular barbers',
                      style: font.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: black)),
                  const HorFilter(),
                ],
              ),
              const SizedBox(height: 15),
              //data barber
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: BlocBuilder<BarbersProvider, List<Barber>>(
                    bloc: barbersProvider,
                    builder: (context, state) {
                      return Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          ...List.generate(
                              state.length,
                              (index) => BarberItem(
                                    barber: state[index],
                                  ))
                        ],
                      );
                    },
                  ),
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
