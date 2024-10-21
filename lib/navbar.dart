// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:order2/models/user.dart';
// import 'package:order2/screens/account_page.dart';
// import 'package:order2/screens/home_page.dart';
// import 'package:order2/screens/inbox_page.dart';
// import 'package:order2/screens/location_page.dart';
// import 'package:order2/screens/my_order_page.dart';
// import 'package:order2/screens/product_screen.dart';

// class Navbar extends StatefulWidget {
//   const Navbar({super.key});

//   @override
//   State<Navbar> createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();
//   int _selectedIndex = 0;

//   @override
//   void initState(){
//     super.initState();
//     FirebaseFirestore.instance
//     .collection("users")
//     .doc(user!.uid)
//     .get()
//     .then((value){
//       loggedInUser = UserModel.fromMap(value.data());
//       setState(() {
        
//       });
//     });
//   }

//   static const List<Widget> _widgetOptions = <Widget>[
//     // LocationPage(),
//     Homepage(),
//     // keranjangPage(),
//     Myorder(),
//     // Detailpage(),
//     // Menupage(),
//     Productscreen(),
//     Inboxpage(),
//     Accountpage()
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt),
//             label: 'My Order',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_book),
//             label: 'Menu',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Inbox',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined),
//             label: 'Account',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black, // Semua ikon berwarna hitam
//         unselectedItemColor: Colors.grey, // Warna ikon saat tidak dipilih juga hitam
//         type: BottomNavigationBarType.fixed, // Menghilangkan animasi tombol geser
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
