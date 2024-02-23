import 'package:chefease/BottomSheetComponents/CashContainer.dart';
import 'package:chefease/screens/Company_Details.dart';
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                    child:
                    Row(
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.deepOrangeAccent,
                          size: 20,
                        ),
                       SizedBox(width: 20,),
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
                    child:  Row(
                        children: [
                          Icon(
                            Icons.checklist_outlined,
                            color: Colors.deepOrangeAccent,
                            size: 20,
                          ),
                          SizedBox(width: 20,),
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
                                      showModalBottomSheet<void>(
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 800,
                                            width: 500,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  const SizedBox(height: 10),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 20),
                                                    child: Text(
                                                      'Select your payment method',
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const CashContainer(
                                                    icon: Icons.attach_money_outlined,
                                                    text: "Cash",
                                                  ),
                                                  const SizedBox(height: 15),
                                                  const CashContainer(
                                                    icon: Icons.credit_card_outlined,
                                                    text: "Credit or Debit Card",
                                                  ),
                                                  const SizedBox(height: 15),
                                                  // Horizontal row containing both text fields
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const SizedBox(height: 8),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Text(
                                                                    'CARD NUMBER',
                                                                    style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                    ),
                                                                  ),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(
                                                                      filled: true,
                                                                      fillColor: Colors.grey[200],
                                                                      hintText: "7419 9412 5910 218",
                                                                      border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(12),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Text(
                                                                    'CVC',
                                                                    style: TextStyle(
                                                                      fontWeight: FontWeight.normal,
                                                                    ),
                                                                  ),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(
                                                                      filled: true,
                                                                      fillColor: Colors.grey[200],
                                                                      hintText: "230",
                                                                      border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(12),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 10),
                                                        const Text(
                                                          'CARD EXPIRATION',
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.normal,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 100, // Constrain the width of the dropdown button
                                                              child: DropdownButtonFormField<String>(
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: Colors.grey[200],
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(12),
                                                                  ),
                                                                ),
                                                                items: <String>[
                                                                  '01', '02', '03', '04', '05', '06', '07', '08', '09', '10',
                                                                  '11', '12'
                                                                ].map<DropdownMenuItem<String>>((String value) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: value,
                                                                    child: Text(value),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (String? value) {
                                                                  // Handle value change
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10),
                                                            SizedBox(
                                                              width: 100, // Constrain the width of the dropdown button
                                                              child: DropdownButtonFormField<String>(
                                                                decoration: InputDecoration(
                                                                  filled: true,
                                                                  fillColor: Colors.grey[200],
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(12),
                                                                  ),
                                                                ),
                                                                items: <String>[
                                                                  '2022', '2023', '2024', '2025', '2026', '2027', '2028', '2029', '2030'
                                                                ].map<DropdownMenuItem<String>>((String value) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: value,
                                                                    child: Text(value),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (String? value) {
                                                                  // Handle value change
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 10),
                                                        const Text(
                                                          'CARD HOLDER NAME',
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.normal,
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.grey[200],
                                                            hintText: "John Doe",
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(12),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  const CashContainer(
                                                    icon: Icons.attach_money_outlined,
                                                    text: "JazzCash",
                                                  ),
                                                  const SizedBox(height: 20),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => CompanyDetails()),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 293,
                                                      height: 52,
                                                      decoration: ShapeDecoration(
                                                        color: const Color(0xFFFF6A42),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Confirmed',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            )
        )

    )
    );
  }
}
