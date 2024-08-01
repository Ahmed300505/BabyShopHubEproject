import 'package:flutter/material.dart';


class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  int currentIndex = 0;

  void pageShifter(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List myScreens = [

  ];
  void _onBottomNavBarTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => myScreens[index]),
          (Route<dynamic> route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          iconSize: 18,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.purple,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: pageShifter,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Product"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),

          ],
        ),
      ),
    );
  }
}

