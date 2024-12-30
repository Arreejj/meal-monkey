import 'package:flutter/material.dart';
import 'package:areej/common/color_extension.dart';
import 'package:areej/common_widget/round_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0; // Tracks the selected page index
  PageController controller = PageController(); // Controls the PageView

  List pageArr = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/img/on_boarding_1.png",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\nwherever you are",
      "image": "assets/img/on_boarding_2.png",
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real-time tracking of your food on the app\nonce you place the order",
      "image": "assets/img/on_boarding_3.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0; 
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            onPageChanged: (index) {
              setState(() {
                selectPage = index; 
              });
            },
            itemBuilder: (context, index) {
              final pObj = pageArr[index]; 
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pObj["image"].toString(),
                    width: media.width * 0.7,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: media.height * 0.05),
                  Text(
                    pObj["title"].toString(),
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: media.height * 0.02),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                   SizedBox(height: media.height * 0.07),
                ],
              );
            },
          ),
          Positioned(
            bottom: media.height * 0.1,
            left: 0,
            right: 0, 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageArr.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        color: index == selectPage
                            ? TColor.primary
                            : TColor.placeholder,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RoundButton(
                    title: selectPage == pageArr.length - 1
                        ? "Get Started"
                        : "Next",
                    fontSize: 18, 
                    onPressed: () {
                      if (selectPage >= pageArr.length - 1) {
                      
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                     
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
