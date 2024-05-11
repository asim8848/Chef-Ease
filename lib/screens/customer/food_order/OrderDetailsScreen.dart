import 'package:chefease/BottomSheetComponents/CashContainer.dart';
import 'package:chefease/screens/customer/food_order/KitchenDetailsScreen.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                child: Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 34,
            top: 179,
            child: Container(
              width: 130,
              height: 118,
              decoration: ShapeDecoration(
                color: const Color(0x0FFD6500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Positioned(
            left: 44,
            top: 206,
            child: Container(
              width: 113,
              height: 64,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/pizzalist.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 191,
            top: 197,
            child: SizedBox(
              width: 206,
              child: Text(
                'Peperoni Special Pizza',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: -0.15,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 191,
            top: 225,
            child: SizedBox(
              width: 64,
              child: Text(
                '1000 Rs.',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.12,
                  letterSpacing: -0.14,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 72,
            top: 392,
            child: SizedBox(
              width: 46,
              child: Text(
                'Cash',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 35,
            top: 499,
            child: SizedBox(
              width: 169,
              height: 23,
              child: Text(
                'Lorem Ipsum Lorem Ipsum ',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 38,
            top: 552,
            child: SizedBox(
              width: 68,
              height: 23,
              child: Text(
                'Subtotal',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 38,
            top: 582,
            child: SizedBox(
              width: 68,
              height: 23,
              child: Text(
                'Discount',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 38,
            top: 612,
            child: SizedBox(
              width: 83,
              height: 23,
              child: Text(
                'Platform Fee',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 307,
            top: 552,
            child: SizedBox(
              width: 68,
              height: 23,
              child: Text(
                'Rs. 1000',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 318,
            top: 582,
            child: SizedBox(
              width: 36,
              height: 23,
              child: Text(
                'Rs. 50',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 315,
            top: 612,
            child: SizedBox(
              width: 40,
              height: 23,
              child: Text(
                'Rs. 100',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 307,
            top: 392,
            child: SizedBox(
              width: 46,
              child: Text(
                '1000 Rs.',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 307,
            top: 499,
            child: SizedBox(
              width: 46,
              child: Text(
                'Rs. 1000',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.16,
                  letterSpacing: -0.12,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 220,
            top: 280,
            child: SizedBox(
              width: 64,
              child: Text(
                '2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: -0.14,
                ),
              ),
            ),
          ),
          Positioned(
            left: 191,
            top: 266,
            child: Container(
              width: 33,
              height: 31,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6A42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Center(
                child: Icon(
                  Icons.remove,
                  color: Colors.white, // You can customize the color as needed
                ),
              ),
            ),
          ),
          Positioned(
            left: 278,
            top: 266,
            child: Container(
              width: 33,
              height: 31,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF6A42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white, // You can customize the color as needed
                ),
              ),
            ),
          ),
          const Positioned(
            left: 34,
            top: 144,
            child: SizedBox(
              width: 123,
              height: 19,
              child: Text(
                'My Cart',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.06,
                  letterSpacing: -0.17,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 80,
            top: 67,
            child: SizedBox(
              width: 123,
              height: 19,
              child: Text(
                'Order Details',
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
          ),
          const Positioned(
            left: 25,
            top: 340,
            child: Row(
              children: [
                Icon(
                  Icons.wallet,
                  color: Colors.deepOrangeAccent,
                  size: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Payment Method",
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                    letterSpacing: -0.17,
                  ),
                ),
                SizedBox(width: 140),
                Icon(
                  Icons.edit,
                  color: Colors.deepOrangeAccent,
                  size: 20,
                ),
              ],
            ),
          ),
          const Positioned(
            left: 25,
            top: 455,
            child: Row(
              children: [
                Icon(
                  Icons.checklist_outlined,
                  color: Colors.deepOrangeAccent,
                  size: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Order Summary',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                    letterSpacing: -0.17,
                  ),
                ),
                SizedBox(width: 140),
                Icon(
                  Icons.edit,
                  color: Colors.deepOrangeAccent,
                  size: 20,
                ),
              ],
            ),
          ),
          Positioned(
            left: 35,
            top: 380,
            child: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/money.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 539,
            child: Container(
              width: 393,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.11999999731779099),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: -6,
            top: 433,
            child: Container(
              width: 393,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.11999999731779099),
                  ),
                ),
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
                left: 51,
                right: 50,
                bottom: 13,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 293,
                    height: 53,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 293,
                            height: 52.50,
                            decoration: ShapeDecoration(
                              color: const Color(0x26FD6500),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 1,
                          child: Container(
                            width: 293,
                            height: 52,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFF6A42),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 110,
                          top: 19.5,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CompanyDetails()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: const Text(
                                'Confirm',
                                textAlign: TextAlign.center,
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
    ))));
  }
}
