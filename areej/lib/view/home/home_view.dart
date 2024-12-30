import 'package:flutter/material.dart';
import 'package:areej/common/color_extension.dart';
import 'package:areej/common_widget/round_textfield.dart';
import 'package:areej/common_widget/view_all_title_row.dart';
import 'package:areej/common_widget/popular_restaurant_show.dart';
import 'package:areej/common_widget/most_popular_cell.dart';
import 'package:areej/common_widget/recent_item_row.dart';
import 'package:areej/common_widget/nav_bar.dart';
// Example content for your HomeView
class HomeViewContent extends StatelessWidget {
  final TextEditingController txtSearch;
  final List catArr;
  final List popArr;
  final List mostPopArr;
  final List recentArr;

  const HomeViewContent({
    super.key,
    required this.txtSearch,
    required this.catArr,
    required this.popArr,
    required this.mostPopArr,
    required this.recentArr,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 46),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Good morning!",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/img/shopping_cart.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivering to",
                    style: TextStyle(color: TColor.secondaryText, fontSize: 11),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 25),
                      Image.asset(
                        "assets/img/dropdown.png",
                        width: 12,
                        height: 12,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundTextfield(
                hintText: "Search Food",
                controller: txtSearch,
                left: Container(
                  alignment: Alignment.center,
                  width: 30,
                  child: Image.asset(
                    "assets/img/search.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Categories
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: catArr.length,
                itemBuilder: (context, index) {
                  var cObj = catArr[index] as Map? ?? {};
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        Image.asset(
                          cObj['image']!,
                          width: 90,
                          height: 90,
                        ),
                        Text(cObj['name']!),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ViewAllTitleRow(
                title: "Popular Restaurants",
                onView: () {},
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: popArr.length,
              itemBuilder: ((context, index) {
                var pObj = popArr[index] as Map? ?? {};
                return PopularRestaurantRow(
                  pObj: pObj,
                  onTap: () {},
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ViewAllTitleRow(
                title: "Most Popular",
                onView: () {},
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: mostPopArr.length,
                itemBuilder: ((context, index) {
                  var mObj = mostPopArr[index] as Map? ?? {};
                  return MostPopularCell(
                    mObj: mObj,
                    onTap: () {},
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ViewAllTitleRow(
                title: "Recent Items",
                onView: () {},
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: recentArr.length,
              itemBuilder: ((context, index) {
                var rObj = recentArr[index] as Map? ?? {};
                return RecentItemRow(
                  rObj: rObj,
                  onTap: () {},
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

// Now, we include the NavBar in the HomeView

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  List catArr = [
    {"image": "assets/img/cat_offer.png", "name": "Offers"},
    {"image": "assets/img/cat_sri.png", "name": "Sri Lankan"},
    {"image": "assets/img/cat_3.png", "name": "Italian"},
    {"image": "assets/img/cat_4.png", "name": "Indian"},
  ];

  List popArr = [
    {
      "image": "assets/img/res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_3.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/img/m_res_1.png",
      "name": "Minute by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/m_res_2.png",
      "name": "Café de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List recentArr = [
    {
      "image": "assets/img/item_1.png",
      "name": "Mulberry Pizza by Josh",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_2.png",
      "name": "Barita",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_3.png",
      "name": "Pizza Rush Hour",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return NavBar(
      initialTab: 0, // Highlight the initial tab
      pages: [
        HomeViewContent(
          txtSearch: txtSearch,
          catArr: catArr,
          popArr: popArr,
          mostPopArr: mostPopArr,
          recentArr: recentArr,
        ),
      ],
    );
  }
}
