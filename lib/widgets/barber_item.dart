import 'package:barber_app_ui/const.dart';
import 'package:barber_app_ui/models/barber_model.dart';
import 'package:barber_app_ui/size_config.dart';
import 'package:flutter/material.dart';

class BarberItem extends StatelessWidget {
  final Barber barber;
  const BarberItem({
    Key? key,
    required this.barber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.all(15),
      width: ((SizeConfig.screenWidth! * 0.75) - 90) / 3,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: grey.shade300),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/spinner.gif', image: barber.avatar),
                ),
              ),
              Text(
                '\$${barber.price.toInt()}',
                style: font.copyWith(
                    fontSize: 22, color: black, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    barber.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: font.copyWith(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 2),
                  Row(
                    children: [
                      const Icon(Icons.star, color: orange, size: 14),
                      Text(
                        barber.rate.toString(),
                        style: font.copyWith(fontSize: 10, color: orange),
                      ),
                      Text(
                        "(${barber.clients} clients)",
                        style: font.copyWith(fontSize: 10, color: orange),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              Text(
                barber.location,
                style: font.copyWith(
                    fontSize: 10, color: grey, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                ...List.generate(barber.services.length, (index) {
                  var serv = barber.services[index];
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.cut,
                            color: black,
                            size: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          serv,
                          style: font.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                color: orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Book',
                  style: font.copyWith(color: white, fontSize: 12),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                color: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: orange)),
                child: Text(
                  'More Info',
                  style: font.copyWith(color: orange, fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
