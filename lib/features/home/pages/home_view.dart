import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

import '../manager/cubit.dart';
import '../widgets/category_item.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> items = [
    Stack(children: [
      Image.asset(
        "assets/images/banner_1.png",
      ),
      Positioned(
        top: 33,
        left: 16,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("UP TO 25% \n OFF",
              style: TextStyle(
                  color: Color(0xff004182),
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          Text("For all Headphones\n & AirPods",
              style: TextStyle(
                  color: Color(0xff004182),
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff004182),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {},
            child: const Text("Shop Now"),
          )
        ]),
      ),
    ]),
    Stack(children: [
      Image.asset(
        "assets/images/banner_1.png",
      ),
      Positioned(
        top: 33,
        left: 16,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("UP TO 25% \n OFF",
              style: TextStyle(
                  color: Color(0xff004182),
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          Text("For all Headphones\n & AirPods",
              style: TextStyle(
                  color: Color(0xff004182),
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff004182),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {},
            child: const Text("Shop Now"),
          )
        ]),
      ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {

    var cubit = HomeCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff06004F),
                      ),
                      hintText: " what do you search for?",
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Color(0xff06004F)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.add_shopping_cart,
                  size: 32,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Carousel(
              height: 200,
              indicatorBarColor: Colors.white,
              activateIndicatorColor: const Color(0xff004182),
              items: [
                Image.asset(
                  "assets/images/image1.png",
                ),
                Image.asset(
                  "assets/images/image2.png",
                ),
                Image.asset(
                  "assets/images/image3.png",
                )
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: "assets/fonts/Poppins-Medium.ttf",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff06004F),
                    ),
                  ),
                ),
                Text(
                  "view all",
                  style: TextStyle(
                    fontFamily: "assets/fonts/Poppins-Medium.ttf",
                    fontSize: 12,
                    color: Color(0xff06004F),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 400,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                // physics: const ScrollPhysics(),
                // shrinkWrap: true,
                itemCount: cubit.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 2,
                  childAspectRatio: 10/6
                ),
                itemBuilder: (context, index) => CategoryItem(
                  image: cubit.categoriesList[index].image,
                  title: cubit.categoriesList[index].name,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
