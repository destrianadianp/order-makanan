// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:order/page/menu_page.dart';

// class CheckOutScreen extends StatefulWidget {
//   const CheckOutScreen({super.key});

//   @override
//   State<CheckOutScreen> createState() => _CheckOutScreenState();
// }

// class _CheckOutScreenState extends State<CheckOutScreen> {
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//        leading: const Icon(Icons.arrow_back_ios, size: 18,),
//        title: Text("Keranjang", style: GoogleFonts.mulish(fontSize: 18),),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Item Cart
//               Row(
//                 children: [
//                   Image.asset(
//                     'assets/grilled_meat.png', // Gambar produk
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 10),
//                   const Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Grilled meat fresh vegetable",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                         SizedBox(height: 5),
//                         Text("Rp. 32.000", style: TextStyle(fontSize: 14)),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   IconButton(
//                     icon: const Icon(Icons.remove),
//                     onPressed: () {
//                       setState(() {
//                         if (quantity > 1) {
//                           quantity--;
//                         }
//                       });
//                     },
//                   ),
//                   Text('$quantity', style: const TextStyle(fontSize: 16)),
//                   IconButton(
//                     icon: const Icon(Icons.add),
//                     onPressed: () {
//                       setState(() {
//                         quantity++;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.sticky_note_2),
//                     onPressed: () {
//                       // Add note functionality
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const Divider(),

//               // "Ada lagi yang mau dibeli?" Section
//               const Text("Ada lagi yang mau dibeli?", style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Menupage()));
//                 },
//                 child: const Text("Tambah"),
//               ),
//               const SizedBox(height: 20),

//               // Alamat Pengantaran Section
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Alamat pengantaran",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Change address functionality
//                     },
//                     child: const Text("Ganti alamat"),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const Text("Jl. Ngesrep Timur V No.65", style: TextStyle(fontSize: 14)),
//               const SizedBox(height: 20),

//               // Ringkasan Pembayaran
//               const Text(
//                 "Ringkasan pembayaran",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Harga", style: TextStyle(fontSize: 14)),
//                         Text("Rp. 14.000", style: TextStyle(fontSize: 14)),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Biaya Penanganan", style: TextStyle(fontSize: 14)),
//                         Text("Rp. 3.000", style: TextStyle(fontSize: 14)),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Biaya Pengiriman", style: TextStyle(fontSize: 14)),
//                         Text("Rp. 15.000", style: TextStyle(fontSize: 14)),
//                       ],
//                     ),
//                     Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Total pembayaran",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                         Text("Rp. 32.000",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Pembayaran Section
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Tunai", style: TextStyle(fontSize: 14)),
//                   Text("Rp. 32.000", style: TextStyle(fontSize: 14)),
//                   // SizedBox(width: 10,),
//                   Icon(Icons.more_horiz)
//                 ],
//               ),
//               const SizedBox(height: 10),

//               // Tombol Pesan dan Antar Sekarang
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Order functionality
//                   },
//                   child: const Text(
//                     "Pesan dan antar sekarang",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }