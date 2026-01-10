import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class CustomDecoratedContainer extends StatelessWidget {
  final Color? bgColor;
  final double? padding;
    final double? radius;
      final Color? borderColor;
      final Widget child;
  const CustomDecoratedContainer({super.key, this.bgColor, this.padding, this.radius, this.borderColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? Dimensions.paddingSize10),
                  decoration: BoxDecoration(
                    color: bgColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(radius ?? Dimensions.radius10),
                    border: Border.all(

                      width: 0.5,color: borderColor ??Colors.white
                    )
                  ),
                  child: child,
    );
  }
}