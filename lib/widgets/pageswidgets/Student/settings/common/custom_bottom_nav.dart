import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0x1A000000),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavItem('Home', Icons.home_outlined),
                _buildNavItem('Discover', Icons.explore_outlined),
                _buildNavItem('Notifications', Icons.notifications_outlined),
                _buildProfileNavItem(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Icon(
        icon,
        size: 24,
        color: Colors.black,
      ),
    );
  }

  Widget _buildProfileNavItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF3399FF),
            width: 2,
          ),
        ),
        child: ClipOval(
          child: Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/2971c92db0b3683dfae7b0780bb3ceafd696c7cd',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
