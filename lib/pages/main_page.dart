import 'package:barber_app_ui/bloc_providers/page_provider.dart';
import 'package:barber_app_ui/const.dart';
import 'package:barber_app_ui/models/menus.dart';
import 'package:barber_app_ui/pages/home_page.dart';
import 'package:barber_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PageProvider pageProvider = BlocProvider.of<PageProvider>(context);

    Widget body() {
      switch (pageProvider.state) {
        case 0:
          return const HomePage();
        case 1:
          return Center(
              child: Text(
            'Profile',
            style: font.copyWith(fontSize: 32, color: black),
          ));
        case 2:
          return Center(
              child: Text(
            'Overview',
            style: font.copyWith(fontSize: 32, color: black),
          ));
        case 3:
          return Center(
              child: Text(
            'Help',
            style: font.copyWith(fontSize: 32, color: black),
          ));
        default:
          return Center(
              child: Text(
            'Home',
            style: font.copyWith(fontSize: 32, color: black),
          ));
      }
    }

    return BlocBuilder<PageProvider, int>(
      bloc: pageProvider,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: deepPurple,
            leadingWidth: SizeConfig.screenWidth! * 0.25,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            leading: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/moustache.svg',
                    height: 32,
                    fit: BoxFit.cover,
                    color: white.withOpacity(0.5),
                  ),
                  const SizedBox(width: 10),
                  Text('BS',
                      style: font.copyWith(
                          fontSize: 16,
                          color: white.withOpacity(0.5),
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            toolbarHeight: 70,
            elevation: 0,
            title: Row(
              children: [
                ...List.generate(
                    menus.length,
                    (index) => GestureDetector(
                          onTap: () {
                            pageProvider.setCurrentPage(index);
                          },
                          child: Container(
                            height: 30,
                            margin: const EdgeInsets.only(right: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  menus[index],
                                  style: font.copyWith(
                                      fontSize: 14,
                                      color: state == index
                                          ? white
                                          : white.withOpacity(0.5)),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  width: state == index ? 5 : 0,
                                  height: state == index ? 5 : 0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: white),
                                )
                              ],
                            ),
                          ),
                        ))
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white.withOpacity(0.2)),
                          child: const Icon(
                            Icons.notifications_outlined,
                            color: white,
                          ),
                        ),
                        Positioned(
                          right: -2,
                          top: -2,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                color: deepPurple, shape: BoxShape.circle),
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Erik Shelton',
                            style: font.copyWith(
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.bold)),
                        Text('Houston USA',
                            style: font.copyWith(
                                fontSize: 12,
                                color: white,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15)),
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/spinner.gif',
                          image:
                              'https://robohash.org/molestiasetnihil.png?size=50x50&set=set1'),
                    )
                  ],
                ),
              )
            ],
          ),
          body: body(),
        );
      },
    );
  }
}
