// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:order/page/change_password_page.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   // Contoh data pengguna yang login
//   final String firstName = "Destriana";
//   final String lastName = "Dian pratiwi";
//   final String email = "destriana1912@gmail.com";
//   final String phoneNumber = "+62 85705479350";

//   @override
//   Widget build(BuildContext context) {
//     Widget buildInfoRow(String label, String value) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: const TextStyle(color: Colors.grey)),
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Text(value),
//           ),
//         ],
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, size: 18),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "My Profile",
//           style: GoogleFonts.mulish(fontSize: 20),
//         ),
//         // actions: [
//         //   TextButton(onPressed: onPressed, child: Text("save"))
//         //   // IconButton(
//         //   //   icon: Icon(Icons.edit),
//         //   //   onPressed: () => Navigator.push(
//         //   //       context, MaterialPageRoute(builder: (context) => EditProfileScreen())),
//         //   // )
//         // ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(child: TextField(decoration: InputDecoration(
//                   labelText: firstName
//                 ),)),
//                 const SizedBox(width: 16),
//                 Expanded(child: buildInfoRow("Last Name", lastName)),
//               ],
//             ),
//             const SizedBox(height: 16),
//             buildInfoRow("Email Address", email),
//             const SizedBox(height: 16),
//             buildInfoRow("Phone Number", phoneNumber),
//             const SizedBox(height: 30),

//             // Change Password Button
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () => Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const Changepassword())),
//                 child: Center(
//                   child: Text(
//                     "Save",
//                     style: GoogleFonts.mulish(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
