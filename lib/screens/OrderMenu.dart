
import 'package:chefease/screens/ViewCart.dart';
import 'package:flutter/material.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({super.key});

  @override
  State<OrderMenu> createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: 393,
            height: 958,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 48,
                  top: 117,
                  child: Container(
                    width: 297,
                    height: 168,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/imgs/pizzalist.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 319,
                  child: Text(
                    'Peperoni Special Pizza',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: -0.16,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 402,
                  child: SizedBox(
                    width: 187,
                    height: 19,
                    child: Text(
                      'Choose your variation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                        letterSpacing: -0.16,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 565,
                  child: Text(
                    'Choose Your Extra Topping',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: -0.16,
                    ),
                  ),
                ),
                Positioned(
                  left: 26,
                  top: 691,
                  child: Text(
                    'Choose Your Drinks',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: -0.16,
                    ),
                  ),
                ),
                Positioned(
                  left: 313,
                  top: 319,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Rs.',
                          style: TextStyle(
                            color: Color(0xFFFF6A42),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: -0.14,
                          ),
                        ),
                        TextSpan(
                          text: ' 1200',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: -0.14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 349,
                  child: Text(
                    'Korem ipsum',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 440,
                  child: Text(
                    '7 Inches (Single Serving)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 288,
                  top: 442,
                  child: Text(
                    'Rs 2000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 288,
                  top: 602,
                  child: Text(
                    'Rs +60',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 292,
                  top: 728,
                  child: Text(
                    'Rs +60',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 288,
                  top: 635,
                  child: Text(
                    'Rs +60',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 292,
                  top: 761,
                  child: SizedBox(
                    width: 62,
                    height: 21,
                    child: Text(
                      'Rs +60',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        height: 0.09,
                        letterSpacing: -0.13,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 288,
                  top: 475,
                  child: Text(
                    'Rs 2000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 288,
                  top: 510,
                  child: Text(
                    'Rs 2000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 475,
                  child: Text(
                    '12 Inches (Single Serving)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 510,
                  child: Text(
                    '15 Inches (Single Serving)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 602,
                  child: Text(
                    'Chicken (Single Serving)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 26,
                  top: 728,
                  child: Text(
                    'Pepsi (250ml)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 298,
                  top: 565,
                  child: Text(
                    '(Optional)',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.46000000834465027),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 303,
                  top: 692,
                  child: Text(
                    '(Optional)',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.46000000834465027),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 635,
                  child: Text(
                    'Garlic Mayo (Single Serving)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.09,
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
                Positioned(
                  left: 26,
                  top: 761,
                  child: SizedBox(
                    width: 198,
                    height: 21,
                    child: Text(
                      'Sprite (250ml)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        height: 0.09,
                        letterSpacing: -0.13,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 352,
                  top: 435,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFF6A42)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 355,
                  top: 438,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF6A42),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 352,
                  top: 470,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFF6A42)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 352,
                  top: 505,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFF6A42)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 352,
                  top: 597,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFF6A42)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 356,
                  top: 722,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFF58601)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 352,
                  top: 630,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFF6A42)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 356,
                  top: 765,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFFF58601)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 66,
                  top: 71,
                  child: Text(
                    'Order Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.06,
                      letterSpacing: -0.17,
                    ),
                  ),
                ),
                Positioned(
                  left: -1,
                  top: 736,
                  child: Container(
                    width: 394,
                    height: 79,
                    padding: const EdgeInsets.only(
                      top: 13,
                      left: 18,
                      right: 18,
                      bottom: 12.59,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 358,
                          height: 53.41,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 358,
                                  height: 52.50,
                                  decoration: ShapeDecoration(
                                    color: Color(0x26FD6500),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 162,
                                top: 0.91,
                                child: Container(
                                  width: 196,
                                  height: 52.50,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF6A42),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),


                              Positioned(
                                left: 200,
                                top: 5,
                                child: ElevatedButton(
                                  onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewCart()),
                                      );
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFFF6A42),// Button color
                                  ),
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.08,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 69,
                                top: 5,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle the button press
                                  },
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.08,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                              ),
          
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
