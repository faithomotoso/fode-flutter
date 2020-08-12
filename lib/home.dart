import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fode_flutter/components/components.dart';
import 'package:fode_flutter/components/discount_coupon.dart';
import 'package:fode_flutter/components/logo.dart';
import 'package:fode_flutter/components/menu/menu.dart';
import 'package:fode_flutter/components/search.dart';
import 'package:fode_flutter/paint/bg_paint.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  double height;
  double width;
  String price = "\$7.90";

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: CustomPaint(
              painter: BgPaint(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 16),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // contains the food image on the right and food details on the left
                              children: [
                                foodDetails(),
                                SizedBox(width: width * 0.01,),
                                Card(
                                  color: Colors.grey.withOpacity(0.2),
                                  elevation: 160,
                                  clipBehavior: Clip.antiAlias,
                                  shape: CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("/images/pasta.png"),
                                    radius: 290,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [chefsRecommendationWidget(),
                              DiscountCoupon()],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget header() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logo(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Row(
            children: [
              SearchButton(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Menu()
            ],
          ),
          Row(
            children: [
              button(
                  title: "Sign Up",
                  borderColor: Colors.white,
                  fontColor: Colors.white),
              const SizedBox(
                width: 20,
              ),
              button(
                  title: "Login",
                  fontColor: Colors.black,
                  filledColor: Colors.amber),
            ],
          )
        ],
      ),
    );
  }

  Widget foodDetails() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Italian Pasta",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "With Special Sauce",
          style: TextStyle(fontSize: 52, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
              text:
                  "Italian pasta with special sauce is a\nflavour you can find only in ",
              style: TextStyle(color: Colors.grey, fontSize: 24, height: 1.4),
              children: [
                TextSpan(
                    text: "fode.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ]),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey.withOpacity(0.7),
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 46,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(width: 45),
            RaisedButton(
              onPressed: () {},
              shape: StadiumBorder(),
//              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 70),
              color: Colors.black,
              elevation: 20,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amberAccent,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          )),
                      padding: EdgeInsets.all(12),
                      child: Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget chefsRecommendationWidget() {
    return Row(
      children: [
        Image.asset(
          "images/chef_avatar.png",
          height: 100,
          width: 100,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chef's Recommendation",
              style: TextStyle(fontSize: 24),
            ),
            Row(
              children: [
                Text(
                  "See the menu types",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
