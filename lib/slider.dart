import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isExpanded = false;
  final CarouselController _carouselController = CarouselController();
  final List<String> _images = [
    'https://babyplanet.pk/cdn/shop/files/01-hb150724.jpg?v=1721049866&width=2000',
    'https://babyplanet.pk/cdn/shop/files/05-hb150724.jpg?v=1721049866&width=2000',
    'https://babyplanet.pk/cdn/shop/files/07-hb150724.jpg?v=1721049866&width=2000',
    'https://babyplanet.pk/cdn/shop/files/03-hb150724.jpg?v=1721049866&width=2000',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              image,
              fit: BoxFit.fill,
              width: 500,
              height: 180,
            );
          },
        );
      }).toList(),
      carouselController: _carouselController,
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        scrollPhysics: const ScrollPhysics(),
        height: 250,
        autoPlayInterval: const Duration(seconds: 3),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

