import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class GraphCustomButton extends StatelessWidget {
  final String buttonText;
  final bool isSelectedButton;
  const GraphCustomButton({super.key,required this.buttonText,required this.isSelectedButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: isSelectedButton ? [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ] : null,
          color: isSelectedButton ? Theme.of(context).cardColor:Colors.grey.withValues(alpha:0.2)
      ),
      child:  Center(
        child: Text(buttonText,style:  TextStyle(fontSize: Dimensions.fontSize14,color: isSelectedButton?
        Theme.of(context).primaryColor:Colors.white,fontWeight: FontWeight.w500),),
      ),

    );
  }
}