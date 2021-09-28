import 'package:azcourses/bloc/model/offer.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CustomCarousel extends StatelessWidget {

  final List<Offer> offers;


  CustomCarousel({@required this.offers});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider.builder(
        itemCount: offers.length,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: .7,
          height:
          ScreenHelper.screenHeight(context, 160.0),
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(
                    context, 0)),
            child: AspectRatio(
              aspectRatio: 2,
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(
                            ScreenHelper.screenRadius(
                                context, 10)))),
                color: MAINCOLOR,
                elevation: 1,
                child: Image(
                  image: NetworkImage(
                    offers[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }
}
