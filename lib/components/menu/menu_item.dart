import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String title;
  Function onClicked;

  /// index of the menu item, to be checked with selected index
  int itemIndex;

  /// selected index indicating the selected menu item
  int selectedIndex;

  IconData rightIcon;

  MenuItem(
      {@required this.title,
      this.onClicked,
      this.itemIndex,
      @required this.selectedIndex,
      this.rightIcon}) {
    assert(title != null, "Title can't be null");
  }

  @override
  State<StatefulWidget> createState() {
    return _MenuItemState();
  }
}

class _MenuItemState extends State<MenuItem>
    with SingleTickerProviderStateMixin {
  String title;
  AnimationController animationController;
  Animation colorAnimation;
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(-1);

  @override
  void initState() {
    super.initState();
    title = widget.title;

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
      reverseDuration: Duration(milliseconds: 100)
    );
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.black).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeOut));

    selectedIndex.addListener(() {
      if (selectedIndex.value == widget.itemIndex) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // color when colors have been created and itemIndex assigned
    // showing initial selected index
    if (widget.selectedIndex == widget.itemIndex) {
      animationController.forward();
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedIndex.value = widget.selectedIndex;
  }

  @override
  void dispose() {
    animationController.dispose();
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Align(
          child: InkWell(
            onTap: () {
              widget.onClicked();
            },
            hoverColor: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: colorAnimation.value,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                if (widget.rightIcon != null)
                  Container(
                        child: Icon(
                      widget.rightIcon,
                      color: colorAnimation.value,
                    )
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
