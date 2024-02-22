import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  ListView(
      children: [
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                children: [
                  Text(
                    'All Reviews (500+)',
                    style: TextStyle(
                      color: Color(0xFF111014),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.16,
                      letterSpacing: -0.80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: Icon(Icons.star, color: Colors.orange, size: 22),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '4.3',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.08,
                      letterSpacing: -0.16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Color(0xFFF8F9FB),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                radius: 20,
              ),
              title: Text(
                'Anna',
                style: TextStyle(
                  color: Color(0xFF111014),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.25,
                  letterSpacing: -0.65,
                ),
              ),
              subtitle: Text(
                'Great Taste <3',
                style: TextStyle(
                  color: Color(0x7C1E1E1E),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.17,
                  letterSpacing: -0.28,
                ),
              ),
              trailing: Icon(Icons.star, color: Colors.orange, size: 26),
            ),
            SizedBox(height: 5,),
            ListTile(
              tileColor: Color(0xFFF8F9FB),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                radius: 20,
              ),
              title: Text(
                'Anna',
                style: TextStyle(
                  color: Color(0xFF111014),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.25,
                  letterSpacing: -0.65,
                ),
              ),
              subtitle: Text(
                'Great Taste <3',
                style: TextStyle(
                  color: Color(0x7C1E1E1E),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.17,
                  letterSpacing: -0.28,
                ),
              ),
              trailing: Icon(Icons.star, color: Colors.orange, size: 26),
            ),
            SizedBox(height: 5,),
            ListTile(
              tileColor: Color(0xFFF8F9FB),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                radius: 20,
              ),
              title: Text(
                'Anna',
                style: TextStyle(
                  color: Color(0xFF111014),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.25,
                  letterSpacing: -0.65,
                ),
              ),
              subtitle: Text(
                'Great Taste <3',
                style: TextStyle(
                  color: Color(0x7C1E1E1E),
                  fontSize: 11,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.17,
                  letterSpacing: -0.28,
                ),
              ),
              trailing: Icon(Icons.star, color: Colors.orange, size: 26),
            ),
            SizedBox(height: 5,),
            TextButton(
              onPressed: () {
                print("Clicked");
              },
              child: Center(
                child: Text(
                  'View More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7C1E1E1E),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.17,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
            ),
            Divider(thickness: 1,),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Text(
                'Add your review',
                style: TextStyle(
                  color: Color(0xFF111014),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.16,
                  letterSpacing: -0.80,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type Something . . . . .',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF8F9FB),
                ),
                style: TextStyle(
                  color: Color(0xFF111014),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),


          ],
        ),
  ]
    );




  }
}
