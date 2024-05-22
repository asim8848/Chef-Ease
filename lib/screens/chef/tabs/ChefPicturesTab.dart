// import 'package:flutter/material.dart';
// class UserPictures extends StatefulWidget {
//   const UserPictures({super.key});
//
//   @override
//   State<UserPictures> createState() => _UserPicturesState();
// }
//
// class _UserPicturesState extends State<UserPictures> {
//   final List<String> imageUrls = [
//     'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/699953/pexels-photo-699953.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/323682/pexels-photo-323682.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     'https://images.pexels.com/photos/1482803/pexels-photo-1482803.jpeg?auto=compress&cs=tinysrgb&w=1200',
//     // Add more image URLs as needed
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5.0),
//       child: GridView.builder(
//         itemCount: imageUrls.length, // Use the length of your image URLs list
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 3.0,
//           mainAxisSpacing: 3.0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           // Use the image URLs from the list
//           return Image.network(
//             imageUrls[index], // Get image URL based on index
//             fit: BoxFit.cover,
//           );
//         },
//       ),
//     );
//   }
// }
