import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Example> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.none,
      width: double.maxFinite,
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        itemCount: listOfIcons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelected = index == currentIndex;

          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              width: size.width * .19999999999,
              height: 60,
              color: Colors.white,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: isSelected ? -40 : 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.deepOrange : Colors.transparent,
                        borderRadius:
                            isSelected ? BorderRadius.circular(16) : null,
                        border: isSelected
                            ? Border.all(color: Colors.white, width: 3)
                            : null,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : null,
                      ),
                      child: Icon(
                        listOfIcons[index],
                        size: isSelected ? 50 : size.width * .076,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      top: 10,
                      bottom: 20,
                      left: (size.width * .19999999999) / 2.6 - 5,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_outlined,
    Icons.note_add_rounded,
    Icons.add_circle_outline,
    Icons.delivery_dining_outlined,
    Icons.chat_outlined, // Added new icon
  ];
}
