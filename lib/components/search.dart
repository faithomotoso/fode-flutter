import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchButtonState();
  }
}

class _SearchButtonState extends State<SearchButton> {
  ValueNotifier<bool> isOpened = ValueNotifier<bool>(false);
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOpened,
      builder: (context, isOpened, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: isOpened ? 300 : null,
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 1,
                    spreadRadius: 0.1,
                    offset: Offset(3, 0))
              ]),
          child: Row(
            children: [
              if (isOpened)
                Expanded(
                  child: CupertinoTextField(
                    controller: searchController,
                    showCursor: true,
                    padding: const EdgeInsets.all(8),
                    autofillHints: ["apple", "ball"],
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.transparent, width: 0)),
                  ),
                ),
              IconButton(
                onPressed: () {
//                  this.isOpened.value = !this.isOpened.value;
                },
                icon: Icon(CupertinoIcons.search),
              ),
            ],
          ),
        );
      },
    );
  }
}
