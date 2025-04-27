import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/src/cart/views/cart_screen.dart';
import 'package:doula/src/home/views/home_screen.dart';
import 'package:doula/src/profile/views/profile_screen.dart';
import 'package:doula/src/wishlist/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


class AppEntryPoint extends StatefulWidget {
  const AppEntryPoint({super.key});

  @override
  State<AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends State<AppEntryPoint> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Kolors.kRed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), 
          label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined ), 
          label: 'Profile'),
        ],
        showUnselectedLabels: false,
        selectedItemColor: Kolors.kWhite, // Customize as needed
        unselectedItemColor: Kolors.kGray, // Customize as needed
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
