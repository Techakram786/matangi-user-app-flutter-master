import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matangi_user_app/CustomClass/AllColors.dart';
import 'package:matangi_user_app/data/Model/ProductDetailModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MediaCarouselWidget extends StatefulWidget {
  final List<ProductImg> media;

  const MediaCarouselWidget({Key? key, required this.media}) : super(key: key);

  @override
  State<MediaCarouselWidget> createState() => _MediaCarouselWidgetState();
}

class _MediaCarouselWidgetState extends State<MediaCarouselWidget> {
  final _slideController = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.sizeOf(context);

    List<Widget> mediaSlider = widget.media.map(
          (media) => InkWell(
        onTap: () {
          // Custom behavior when tapping the image.
          // You can replace this with your own logic.
          // For example, you can navigate to a new screen or perform any action you desire.
          print('Tapped image: $media');
        },
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(media.img.toString()),

        ),
      ),
    ).toList();

    return Container(
      padding: EdgeInsets.only(bottom: mediaSlider.length > 1 ? 10 : 0),
      color: Colors.white,
      child: StatefulBuilder(builder: (context, carouselState) {
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            CarouselSlider(
              items: mediaSlider,
              carouselController: _slideController,
              options: CarouselOptions(
                initialPage: 0,
                viewportFraction: 1,
                height: mqSize.height * 0.48,
                enableInfiniteScroll: false,
                scrollPhysics: const BouncingScrollPhysics(),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (index, reason) {
                  carouselState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            if (mediaSlider.length > 1)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: mediaSlider.length,
                    effect: SlideEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: AllColors.accentColor,
                      dotColor: const Color.fromRGBO(112, 104, 104, 0.3),
                    ),
                    onDotClicked: (clickedIndex) {
                      _slideController.animateToPage(clickedIndex);
                    },
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
