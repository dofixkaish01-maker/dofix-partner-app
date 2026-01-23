import 'package:flutter/material.dart';

import '../../utils/images.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            left: MediaQuery.of(context).size.width / 4 * widget.currentIndex + (widget.currentIndex == 0?17:widget.currentIndex == 1?20:widget.currentIndex == 2?35:30),
            child: CustomIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Images.icHome, "HOME", 0),
                _buildNavItem(Images.icServices, "NAYA KAAM", 1),
                _buildNavItem(Images.icBooking, "BOOKINGS", 2),
                _buildNavItem(Images.icWallet, "PAISE", 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageIcon(AssetImage(icon), size: 28, color: isSelected ? Color(0xfff207FA8) : Colors.grey),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: isSelected ? Color(0xfff207FA8) : Colors.grey)),
        ],
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 25,
      decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage(Images.icIndicator),
         fit: BoxFit.fill,
       ),
      ),
    );
  }
}

