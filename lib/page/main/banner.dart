import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainBanner extends StatelessWidget {
  final images = [
    Image.asset('assets/images/home_banner1.png', fit: BoxFit.fill),
    Image.asset('assets/images/home_banner2.png', fit: BoxFit.fill),
    Image.asset('assets/images/home_banner3.png', fit: BoxFit.fill)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return images[index];
        },
        itemCount: 3,
        autoplay: true,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              size: 5.0,
              activeSize: 5.0,
              color: Colors.black38,
              activeColor: Colors.white,
            )),
      ),
    );
  }
}
