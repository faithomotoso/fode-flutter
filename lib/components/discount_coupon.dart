import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscountCoupon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiscountCouponState();
  }
}

class _DiscountCouponState extends State<DiscountCoupon> {
  double height;
  double width;

  List<PizzaWidget> discounts = [
    PizzaWidget(
      key: ValueKey("1"),
      name: "Mexico Pizza",
      calories: 78,
      price: 8.90,
      discountedPrice: 7.90,
      duration: 30,
      imagePath: "/images/pizza2.png",
    ),
    PizzaWidget(
      key: ValueKey("2"),
      name: "Pepperoni Pizza",
      calories: 84,
      price: 9.90,
      discountedPrice: 6.90,
      duration: 30,
      imagePath: "/images/pizza1.png",
    ),
  ];
  ValueNotifier<Widget> selectedWidget;
  int discountIndex = 0;

  void decrementIndex() {
    if (discountIndex - 1 >= 0) {
      setState(() {
        discountIndex--;
      });
    }
  }

  void incrementIndex() {
    if (discountIndex + 1 < discounts.length) {
      setState(() {
        discountIndex++;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: width * 0.3,
      child: DottedBorder(
        color: Colors.white,
        radius: Radius.circular(20),
        strokeCap: StrokeCap.round,
        strokeWidth: 1.5,
        borderType: BorderType.RRect,
        padding: EdgeInsets.zero,
        dashPattern: [
          5,
        ],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount Coupon",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          decrementIndex();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_left,
                              color: discountIndex != 0
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Prev",
                              style: TextStyle(
                                color: discountIndex != 0
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {
                          incrementIndex();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Next",
                              style: TextStyle(
                                color: discountIndex != discounts.length - 1
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: discountIndex != discounts.length - 1
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: DottedBorder(
                color: Colors.white,
                radius: Radius.circular(20),
                strokeCap: StrokeCap.round,
                strokeWidth: 1.5,
                borderType: BorderType.RRect,
                padding: EdgeInsets.zero,
                dashPattern: [
                  5,
                ],
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
//                transitionBuilder: (Widget child, Animation<double> animation) {
//                  return RotationTransition(child: child, turns: animation,);
//                },
                child: discounts[discountIndex],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PizzaWidget extends StatefulWidget {
  String name;
  String imagePath;
  double calories;
  double price;
  double discountedPrice;
  double duration;

  PizzaWidget(
      {this.name,
      this.imagePath,
      this.calories,
      this.price,
      this.discountedPrice,
      this.duration,
      Key key}) : super(key: key);

  @override
  _PizzaWidgetState createState() => _PizzaWidgetState();
}

class _PizzaWidgetState extends State<PizzaWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(context: context,
                builder: (context) {
                  return Align(
                    child: CircleAvatar(
                      child: Image.asset(widget.imagePath),
                      radius: 300,
                      backgroundColor: Colors.transparent,
                    ),
                  );
                });
              },
              hoverColor: Colors.transparent,
              child: CircleAvatar(
                child: Image.asset(widget.imagePath),
                radius: 40,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.amberAccent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${widget.calories} calories",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$${widget.price.toStringAsFixed(2)}",
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough),
            ),
            Text(
              "\$${widget.discountedPrice.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
              ),
            )
          ],
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30)),
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.duration} clc.",
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
