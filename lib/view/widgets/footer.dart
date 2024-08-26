import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideshare/view/screen/home/favourite_view.dart';
import 'dart:math';
import 'package:rideshare/view/screen/home/profile_page.dart';

class Footer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Footer({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildNavItem(icon: Icons.home, label: "Home", index: 0),
              _buildNavItem(icon: Icons.favorite, label: "Favourite", index: 1),
              const SizedBox(width: 40), 
              _buildNavItem(icon: Icons.local_offer, label: "Offer", index: 2),
              _buildNavItem(icon: Icons.person, label: "Profile", index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        onItemTapped(index);
        if (index == 1) {
          Get.to(() =>  Favourite()); 
        } else if (index == 3) {
          Get.to(() => const Profile(showLogout: true));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.green : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class HexagonButton extends StatelessWidget {
  const HexagonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: 60,
        height: 60,
        color: Colors.green,
        child: const Center(
          child: Icon(Icons.account_balance_wallet, color: Colors.white),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double side = width / 2;
    double radius = side / (sqrt(3) / 2);
    double centerX = width / 2;
    double centerY = height / 2;

    Path path = Path();
    for (int i = 0; i < 6; i++) {
      double angle = (pi / 180) * (60 * i - 30);
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
