// import 'package:flutter/material.dart';
// import 'package:order2/navbar.dart';

// class Changepassword extends StatefulWidget {
//   const Changepassword({super.key});

//   @override
//   State<Changepassword> createState() => _ChangepasswordState();
// }

// class _ChangepasswordState extends State<Changepassword> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(Icons.arrow_back_ios, size: 18),
//         ),
//         title: const Text("Back", style: TextStyle(fontSize: 18)),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Image.asset('assets/key.png'),
//             const Text("Reset Password", style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 "Enter your new password below, we’re just being extra safe",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                 softWrap: true,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: double.infinity,
//               height: 40,
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Text("New password", style: TextStyle(fontSize: 12, color: Colors.grey[500])),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Container(
//               width: double.infinity,
//               height: 40,
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Text("Confirm password", style: TextStyle(fontSize: 12, color: Colors.grey[500])),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               width: double.infinity,
//               height: 40,
//               child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const Navbar()));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF72A8BF),
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 minimumSize: const Size(double.infinity, 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   side: const BorderSide(color: Colors.grey),
//                 ),
//               ),
//               child: const Text(
//                 "SAVE",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
