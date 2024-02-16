
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_1/constants/sizes.dart';
import 'package:flutter_task_1/features/pages/description/description.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';

class MeetUpScreen extends StatefulWidget {
  const MeetUpScreen({super.key});

  @override
  State<MeetUpScreen> createState() => _MeetUpScreenState();
}

class _MeetUpScreenState extends State<MeetUpScreen> {
  final myImages = [
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
  ];
  final conference = [
    "assets/images/conferences/conference1.png",
    "assets/images/conferences/conference2 .png",
    "assets/images/conferences/conference3.png",
    "assets/images/conferences/conference4.png",
    "assets/images/conferences/conference5.png",
  ];

  final places = [
    "assets/images/places/place1.png",
    "assets/images/places/place2.png",
    "assets/images/places/place3.png",
    "assets/images/places/place4.png",
  ];

  final values = [
    "01",
    "02",
    "03",
    "04",
  ];
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.4,
        shadowColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
            child: const Icon(Icons.keyboard_arrow_left, size: 30),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Text(
          kIndividualMeet,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: kLabelColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: kSizes.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  suffixIcon:
                      InkWell(onTap: () {}, child: const Icon(Iconsax.microphone)),
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: const Icon(Iconsax.search_status),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: kSizes.sm, horizontal: kSizes.md),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: kLabelColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: kSizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
              child: CarouselSlider.builder(
                itemCount: myImages.length,
                itemBuilder: (BuildContext context, int index, int i) {
                  final images = myImages[index];
                  return buildImage(images, index);
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  height: 200,
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  enlargeCenterPage: true,
                  onPageChanged: (i, r) {
                    setState(() {
                      myCurrentIndex = i;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: kSizes.defaultSpace),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: myCurrentIndex,
                count: myImages.length,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  dotColor: Colors.grey,
                  activeDotColor: kLabelColor,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
            const SizedBox(height: kSizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
              child: Text(
                "Trending Popular People",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: kLabelColor),
              ),
            ),
            const SizedBox(height: kSizes.defaultSpace),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => SizedBox(
                  height: 180,
                  width: 350,
                  child: Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.black,
                    margin: const EdgeInsets.symmetric(horizontal: kSizes.md,vertical: kSizes.sm),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kSizes.md, vertical: kSizes.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.black,
                                ),
                                child: const Image(
                                  image: AssetImage(
                                      "assets/images/logo/pngwing.com.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(width: kSizes.md),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Author",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .apply(color: kLabelColor),
                                  ),
                                  Text(
                                    "1,023 Meetups",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: kSizes.xs),
                          const Divider(color: Colors.black38),
                          const SizedBox(height: kSizes.sm),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                for (int i = 0; i <= myImages.length; i++)
                                  Align(
                                    widthFactor: 0.8,
                                    child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(conference[i]),
                                        radius: 25),
                                  ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 35,
                              width: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kTextColor),
                              child: Center(
                                  child: Text(
                                "See more",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .apply(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: kSizes.defaultSpace),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
              child: Text(
                "Top Trending Meetups",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: kLabelColor),
              ),
            ),
            const SizedBox(height: kSizes.md),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: places.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,i) => GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (e) => const Description()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(places[i],fit: BoxFit.cover,)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 80,
                              width: 60,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text(values[i],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 46,color: kLabelColor),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: kSizes.defaultSpace),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String images, int i) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          myImages[i],
          fit: BoxFit.cover,
          width: 350,
        ),
      ),
    );
  }
}
