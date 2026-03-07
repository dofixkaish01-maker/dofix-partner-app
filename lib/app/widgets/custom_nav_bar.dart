import 'package:flutter/material.dart';
import '../../utils/images.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  static const Color _active = Color(0xfff207FA8);
  static const double _indicatorW = 50;
  static const double _indicatorH = 25;

  double _indicatorLeft(double width) {
    // 4 items => each segment width
    final itemWidth = width / 4;

    // center of selected item
    final centerX = itemWidth * widget.currentIndex + (itemWidth / 2);

    // indicator left = center - half width
    return centerX - (_indicatorW / 2);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottomPad > 0 ? bottomPad : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 10),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            top: -10,
            left: _indicatorLeft(w),
            child: const CustomIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
    final bool isSelected = widget.currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => widget.onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          scale: isSelected ? 1.06 : 1.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageIcon(
                AssetImage(icon),
                size: 28,
                color: isSelected ? _active : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? _active : Colors.grey,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 25,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.icIndicator),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
