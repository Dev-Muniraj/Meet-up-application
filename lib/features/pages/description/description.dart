import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_task_1/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:share/share.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final myImages = [
    "assets/images/places/place1.png",
    "assets/images/places/place2.png",
    "assets/images/places/place3.png",
    "assets/images/places/place4.png",
  ];
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 2,
        shadowColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
            child: const Icon(Icons.keyboard_arrow_left, size: 30),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Description",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: kLabelColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kSizes.md, vertical: kSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: CarouselSlider.builder(
                            itemCount: myImages.length,
                            itemBuilder: (c, i, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image(
                                image: AssetImage(myImages[i]),
                                fit: BoxFit.fill,
                                height: 350,
                                width: 450,
                              ),
                            ),
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
                        Positioned(
                          top: 180,
                          right: 140,
                          child: AnimatedSmoothIndicator(
                            activeIndex: myCurrentIndex,
                            count: myImages.length,
                            effect: WormEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 5,
                              dotColor: Colors.white.withOpacity(0.7),
                              activeDotColor: Colors.white,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(Iconsax.document_download),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.bookmark_border),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Iconsax.heart),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Iconsax.maximize_44),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Iconsax.star),
                          ),
                          InkWell(
                            onTap: () {
                              Share.share("https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                            },
                            child: const Icon(Icons.share_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kSizes.defaultSpace),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.bookmark_border,
                      color: kTextButtonColor,
                    ),
                  ),
                  const SizedBox(width: kSizes.sm),
                  const Text("1034"),
                  const SizedBox(width: kSizes.md),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Iconsax.heart,
                      color: kTextButtonColor,
                    ),
                  ),
                  const SizedBox(width: kSizes.sm),
                  const Text("1034"),
                  const SizedBox(width: kSizes.md),
                  Container(
                      height: 23,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                              initialRating: 3,
                              maxRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              unratedColor: Colors.white,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                              itemBuilder: (context, _) => const Icon(
                                    Iconsax.star1,
                                    color: kIconColor,
                                  ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              }),
                        ],
                      )),
                  const SizedBox(width: kSizes.sm),
                  Text(
                    "3.2",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: kTextButtonColor),
                  )
                ],
              ),
              const SizedBox(height: kSizes.defaultSpace),
              Text(
                "Actor Name",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: kLabelColor),
              ),
              const SizedBox(height: kSizes.xs),
              Text("Indian Actress",
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: kSizes.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: kSizes.md),
                  Text(
                    "Duration 20 Mins",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              const SizedBox(height: kSizes.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.folder_delete_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: kSizes.md),
                  Text(
                    "Total Average fees Rs.9,999",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              const SizedBox(height: kSizes.defaultSpace),
              Text(
                "About",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: kLabelColor),
              ),
              const SizedBox(height: kSizes.md),
              ReadMoreText(
                "Lakshadweep, the group of 36 islands is known for its exotic and sun-kissed beaches and lush green landscape. The name Lakshadweep in Malayalam and Sanskrit means ‘a hundred thousand islands’.India’s smallest Union Territory Lakshadweep is an archipelago consisting of 36 islands with an area of 32 sq km. It is a uni-district Union Territory and is comprised of 12 atolls, three reefs, five submerged banks and ten inhabited islands. The islands comprise of 32 sq km. The capital is Kavaratti and it is also the principal town of the UT. All Islands are 220 to 440 km away from the coastal city of Kochi in Kerala, in the emerald Arabian Sea. The natural landscapes, the sandy beaches, abundance of flora and fauna and the absence of a rushed lifestyle enhance the mystique of Lakshadweep.The islands are well connected by regular flights from Kochi. Helicopter transfer is available from Agatti to Kavaratti throughout the year. Lakshadweep has a tropical climate and it has an average temperature of 27° C – 32° C. April and May are the hottest with an average temperature of 32° C Generally the climate is humid warm and pleasant. As the climate is equitable during monsoons, ship-based tourism is closed. October to March is the ideal time to be on the islands. From June to October the South West Monsoon is active with an average rainfall of 10-40 mm. The relative humidity is 70-75%. Annual rainfall decreases from South to North. On an average, 80-90 days a year are rainy. Winds are light to moderate from October to March.\t\t",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.left,
                lessStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: kLabelColor),
                moreStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: kLabelColor),
                trimLines: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
